#!/bin/bash

# Detect environment: Termux vs Debian-based (e.g., Raspberry Pi)
IS_TERMUX=false
if grep -qi "termux" <<< "$PREFIX"; then
  IS_TERMUX=true
fi

# Determine installer and update commands
INSTALL_CMD="sudo apt install -y"
UPDATE_CMD="sudo apt update"
if $IS_TERMUX; then
  INSTALL_CMD="pkg install -y"
  UPDATE_CMD="pkg update -y"
fi

# Command check
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install packages
install_packages() {
  echo "📦 Installing $1..."
  if $UPDATE_CMD && $INSTALL_CMD $1; then
    echo "✅ $1 installed successfully"
    return 0
  else
    echo "❌ Failed to install $1"
    return 1
  fi
}

# Ensure pandoc
if ! command_exists pandoc; then
  if ! install_packages pandoc; then
    echo "❌ pandoc is required. Exiting."
    exit 1
  fi
fi

# List markdown files
files=(*.md)
if [ ${#files[@]} -eq 0 ]; then
  echo "❌ No Markdown files found."
  exit 1
fi

echo "📄 Found ${#files[@]} Markdown files:"
for i in "${!files[@]}"; do
  echo "[$i] ${files[$i]}"
done

# User input for order
echo
echo "Enter the file numbers in the order you want (e.g. 0 1 2):"
read -r -a order

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

# Setup workspace
WORKDIR="processed"
mkdir -p "$WORKDIR"
rm -f "$WORKDIR"/*

# CSS style
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
}
EOF

# Function to strip YAML frontmatter from a file
strip_yaml() {
  # Delete lines between the first pair of --- lines (including them)
  sed '/^---$/,/^---$/d' "$1"
}

# Build combined markdown from ordered files
COMBINED="$WORKDIR/combined.md"
echo "# Combined Document" > "$COMBINED"
echo "" >> "$COMBINED"

for idx in "${valid_order[@]}"; do
  f="${files[$idx]}"
  title="${f%.md}"
  echo "# $title" >> "$COMBINED"
  echo "" >> "$COMBINED"
  strip_yaml "$f" >> "$COMBINED"
  echo -e "\n\\newpage\n" >> "$COMBINED"
  echo "➕ Processed: $f"
done

# Output file name with timestamp
output_file="combined_book_$(date +%Y%m%d_%H%M%S).html"

# Convert markdown to HTML with:
# - TOC, mathjax, mermaid support
# - custom CSS
pandoc "$COMBINED" -o "$output_file" \
  --standalone \
  --toc \
  --highlight-style=tango \
  --css="$WORKDIR/style.css" \
  --mathjax \
  --metadata title="My Book" \
  --include-in-header=<(echo '<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script><script>mermaid.initialize({startOnLoad:true});</script>')

# Show result and open command
echo "✅ HTML book created: $output_file"
if $IS_TERMUX; then
  echo "📱 Open in browser:"
  echo "termux-open $output_file"
else
  echo "💻 Open in browser:"
  echo "xdg-open $output_file"
fi
