import os
import re

# Path to your markdown files
path = "docs"

# Regex to match Markdown links
link_pattern = re.compile(r'([^]+)[^)]+')

def remove_links_from_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    updated_content = link_pattern.sub(r'\1', content)
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)

# Process all .md files in the directory
for root, dirs, files in os.walk(path):
    for file in files:
        if file.endswith(".md"):
            remove_links_from_file(os.path.join(root, file))

print("All links removed.")
