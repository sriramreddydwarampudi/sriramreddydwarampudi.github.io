#!/bin/bash

set -e
set -u
[ "${DEBUG:-0}" -eq 1 ] && set -x

IS_TERMUX=false
if [[ "$PREFIX" == *"com.termux"* ]] || [[ "$(uname -o)" == "Android" ]]; then
  IS_TERMUX=true
fi

INSTALL_CMD="sudo apt install -y"
UPDATE_CMD="sudo apt update"
if $IS_TERMUX; then
  INSTALL_CMD="pkg install -y"
  UPDATE_CMD="pkg update -y"
fi

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_packages() {
  echo "📦 Installing $1..."
  $UPDATE_CMD && $INSTALL_CMD "$1"
}

if ! command_exists pandoc; then
  install_packages pandoc
fi

shopt -s nullglob
files=(*.md)
shopt -u nullglob

if [ ${#files[@]} -eq 0 ]; then
  echo "❌ No Markdown files found."
  exit 1
fi

echo "📄 Found ${#files[@]} Markdown files:"
for i in "${!files[@]}"; do
  echo "[$i] ${files[$i]}"
done

echo
echo "Enter the file numbers in the order you want (e.g. 0 1 2):"
read -r -a order

echo "📘 Enter the book title:"
read -r book_title

valid_order=()
for idx in "${order[@]}"; do
  if [[ "$idx" =~ ^[0-9]+$ ]] && [ "$idx" -lt "${#files[@]}" ]; then
    valid_order+=("$idx")
  else
    echo "⚠️ Skipping invalid index: $idx"
  fi
done

if [ ${#valid_order[@]} -eq 0 ]; then
  echo "❌ No valid files selected."
  exit 1
fi

WORKDIR="processed"
mkdir -p "$WORKDIR"
rm -f "$WORKDIR"/*

cat > "$WORKDIR/style.css" << 'EOF'
body {
  font-family: "Helvetica", sans-serif;
  max-width: 800px;
  margin: 2rem auto;
  padding: 0 1rem;
  line-height: 1.6;
  background: #fff;
  color: #333;
}
img {
  max-width: 100%;
  height: auto;
}
h1, h2, h3 {
  border-bottom: 1px solid #ccc;
  padding-bottom: 0.3em;
}
pre, code {
  background: #f0f0f0;
  padding: 0.5em;
  border-radius: 4px;
  overflow-x: auto;
}
EOF

cat > "$WORKDIR/remove_yaml.lua" << 'EOF'
function Meta(meta)
  return {}
end
EOF

COMBINED="$WORKDIR/combined.md"
echo "# $book_title" > "$COMBINED"
echo "" >> "$COMBINED"

for idx in "${valid_order[@]}"; do
  f="${files[$idx]}"
  title="${f%.md}"
  echo "## $title" >> "$COMBINED"
  echo "" >> "$COMBINED"
  sed '/^---$/,/^---$/d' "$f" >> "$COMBINED"
  echo -e "\n\\newpage\n" >> "$COMBINED"
  echo "➕ Processed: $f"
done

# Use absolute path in base href to fix image loading on local file system
BASE_HREF="file://$(pwd)/"

output_file="combined_book_$(date +%Y%m%d_%H%M%S).html"

pandoc "$COMBINED" -o "$output_file" \
  --standalone \
  --toc \
  --highlight-style=tango \
  --css="$WORKDIR/style.css" \
  --mathjax \
  --metadata title="$book_title" \
  --lua-filter="$WORKDIR/remove_yaml.lua" \
  --include-in-header=<(cat <<EOF
<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
  mermaid.initialize({ startOnLoad: true });
});
</script>
<base href="$BASE_HREF">
EOF
)

echo "✅ HTML book created: $output_file"
if $IS_TERMUX; then
  echo "📱 Open in browser:"
  echo "termux-open $output_file"
else
  echo "💻 Open in browser:"
  echo "xdg-open $output_file"
fi
