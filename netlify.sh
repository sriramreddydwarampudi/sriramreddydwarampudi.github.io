#!/data/data/com.termux/files/usr/bin/bash

# Step 1: Sync notes to docs/
rsync -av --delete /storage/emulated/0/_markor/ ~/sriramreddydwarampudi.github.io/docs/

# Step 2: Change to project directory
cd ~/sriramreddydwarampudi.github.io || exit

# Step 3: Stage changes
git add .

# Step 4: Commit with timestamp
git commit -m "Update notes: $(date '+%Y-%m-%d %H:%M:%S')"

# Step 5: Push to main branch
git push origin main