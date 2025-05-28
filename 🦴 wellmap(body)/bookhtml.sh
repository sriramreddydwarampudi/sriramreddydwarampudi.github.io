#!/bin/bash

# Input list of markdown files
input_list="computational-medicine.txt"
output_file="MyBook.html"
title="Computational Medicine"

# Temp directory to hold fixed files
tmpdir=$(mktemp -d)

fix_yaml() {
  local file="$1"
  local outfile="$2"
  local in_yaml=0

  while IFS= read -r line || [ -n "$line" ]; do
    if [[ "$line" == "---" ]]; then
      ((in_yaml = 1 - in_yaml))
      continue  # skip --- markers
    fi
    if [[ $in_yaml -eq 1 ]]; then
      continue  # skip YAML content
    fi
    echo "$line" >> "$outfile"
  done < "$file"
}
# Process all markdown files listed
fixed_files=()

while IFS= read -r file; do
  file="$(echo "$file" | xargs)"
  [ -f "$file" ] || { echo "File not found: $file"; continue; }
  fixed="$tmpdir/$(basename "$file")"
  > "$fixed"
  fix_yaml "$file" "$fixed"
  fixed_files+=("$fixed")
done < "$input_list"

# Generate HTML with MathJax support
pandoc "${fixed_files[@]}" -o "$output_file" \
  --metadata title="$title" \
  --mathjax

echo "Generated HTML: $output_file"

# Clean up
rm -rf "$tmpdir"
