#!/data/data/com.termux/files/usr/bin/bash

# Step 1: Sync notes to docs/
rsync -av --delete /storage/emulated/0/_markor/ ~/sriramreddydwarampudi.github.io/docs/

# Step 2: Change to project directory
cd ~/sriramreddydwarampudi.github.io || exit



# 2. Pull latest changes and auto-merge
git pull origin main --rebase

# 3. Now stage your local changes
git add .

# 4. Commit with timestamp
git commit -m "Update notes: $(date '+%Y-%m-%d %H:%M:%S')"

# 5. Push to main branch
git push origin main