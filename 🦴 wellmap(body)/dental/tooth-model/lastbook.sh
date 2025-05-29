#!/bin/bash
set -euo pipefail

# Detect environment: Termux vs Debian-based (optional)
IS_TERMUX=false
if grep -qi "termux" <<< "${PREFIX:-}"; then
  IS_TERMUX=true
fi

# Check pandoc version (must be 2.x or higher)
if ! command -v pandoc >/dev/null 2>&1; then
  echo "❌ pandoc not found. Please install pandoc 2.x or higher."
  exit 1
fi

pandoc_version=$(pandoc --version | head -n1 | awk '{print $2}')
major_version=${pandoc_version%%.*}
if (( major_version < 2 )); then
  echo "❌ pandoc version 2.x or higher is required. You have $pandoc_version"
  exit 1
fi

# List markdown files in current dir
echo "📄 Markdown files found:"
files=(*.md)
if [ ${#files[@]} -eq 0 ]; then
  echo "❌ No markdown files found."
  exit 1
fi

for i in "${!files[@]}"; do
  echo " [$i] ${files[$i]}"
done

# Get file order from user
echo
read -rp "Enter file numbers in order (e.g. 0 1 2): " -a order

valid_order=()
for idx in "${order[@]}"; do
  if [[ "$idx" =~ ^[0-9]+$ ]] && [ "$idx" -ge 0 ] && [ "$idx" -lt "${#files[@]}" ]; then
    valid_order+=("$idx")
  else
    echo "⚠️ Skipping invalid index: $idx"
  fi
done

if [ ${#valid_order[@]} -eq 0 ]; then
  echo "❌ No valid files selected. Exiting."
  exit 1
fi

# Get book title
read -rp "Enter book title: " book_title
book_title=${book_title:-My Book}

# Prepare workspace
WORKDIR="processed"
mkdir -p "$WORKDIR"
rm -rf "$WORKDIR"/*

# Write CSS file
cat > "$WORKDIR/style.css" <<'EOF'
body {
  font-family: "Helvetica", sans-serif;
  max-width: 800px;
  margin: 2rem auto;
  padding: 0 1rem;
  line-height: 1.6;
  background: #fff;
  color: #333;
}
h1, h2, h3 {
  border-bottom: 1px solid #ccc;
  padding-bottom: 0.3em;
}
img {
  max-width: 100%;
}
pre, code {
  background-color: #f8f8f8;
  padding: 0.5em;
  border-radius: 5px;
  overflow-x: auto;
}
EOF

# Lua filter to remove YAML frontmatter
cat > "$WORKDIR/remove_yaml.lua" <<'EOF'
function Meta(meta)
  return {}
end
EOF

# Lua filter to inline images as base64
cat > "$WORKDIR/inline_images.lua" <<'EOF'
local base64 = require 'base64'

function Image(el)
  local src = el.src
  if src:match("^http") then
    return el -- leave remote URLs as is
  end
  local f = io.open(src, "rb")
  if not f then
    io.stderr:write("⚠️ Warning: cannot open image file " .. src .. "\n")
    return el
  end
  local data = f:read("*all")
  f:close()
  local ext = src:match("^.+(%..+)$")
  local mime = "image/png" -- default
  if ext then
    ext = ext:lower()
    if ext == ".jpg" or ext == ".jpeg" then
      mime = "image/jpeg"
    elseif ext == ".gif" then
      mime = "image/gif"
    elseif ext == ".svg" then
      mime = "image/svg+xml"
    elseif ext == ".webp" then
      mime = "image/webp"
    end
  end
  local b64 = base64.encode(data)
  el.src = "data:" .. mime .. ";base64," .. b64
  return el
end
EOF

# Write combined markdown file
combined_md="$WORKDIR/combined.md"
echo "# $book_title" > "$combined_md"
echo "" >> "$combined_md"

for idx in "${valid_order[@]}"; do
  file="${files[$idx]}"
  section_title="${file%.md}"
  echo "➕ Adding: $file"
  echo "" >> "$combined_md"
  echo "# $section_title" >> "$combined_md"
  echo "" >> "$combined_md"
  cat "$file" >> "$combined_md"
  echo -e "\n\\newpage\n" >> "$combined_md"
done

# Output file name
timestamp=$(date +%Y%m%d_%H%M%S)
output="combined_book_${timestamp}.html"

# Run pandoc to generate HTML
echo "⏳ Generating HTML file: $output"

if pandoc "$combined_md" -o "$output" \
  --standalone \
  --toc \
  --css="$WORKDIR/style.css" \
  --highlight-style=tango \
  --mathjax \
  --metadata title="$book_title" \
  --lua-filter="$WORKDIR/remove_yaml.lua" \
  --lua-filter="$WORKDIR/inline_images.lua" \
  --include-in-header=<(cat <<'HEADER'
<base href="./">
<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", () => {
  mermaid.initialize({startOnLoad:true, securityLevel:"loose"});
});
</script>
HEADER
); then
  echo "✅ HTML book created: $output"
else
  echo "❌ Failed to generate HTML."
  exit 1
fi

# Open in browser (Termux or Linux)
if $IS_TERMUX; then
  echo "📱 Open in browser with: termux-open $output"
else
  echo "💻 Open in browser with: xdg-open $output"
fi
