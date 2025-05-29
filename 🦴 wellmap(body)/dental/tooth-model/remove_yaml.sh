#!/bin/bash

for file in *.md; do
  echo "Processing $file..."

  awk '
    BEGIN { skip = 1 }
    /^[[:space:]]*$/ { if (skip) next }  # skip empty lines at top
    /^[A-Za-z0-9 _-]+: .+/ {
      if (skip) next  # skip colon-lines at top
    }
    {
      skip = 0  # once we hit non-yaml content, stop skipping
      print
    }
  ' "$file" > temp && mv temp "$file"

  echo "✓ Cleaned $file"
done


#!/bin/bash

for file in *.md; do
  echo "Reformatting $file..."

  sed -E 's/^([A-Za-z _-]+):[[:space:]]*/**\1**: /' "$file" > temp && mv temp "$file"

  echo "✓ Reformatted $file"
done
