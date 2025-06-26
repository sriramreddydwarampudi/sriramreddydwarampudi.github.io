#!/data/data/com.termux/files/usr/bin/bash



# create repo in Github with below name



# === CONFIG ===
REPO_NAME="sridaw"
GITHUB_USER="sriramreddydwarampudi"         # <--- CHANGE THIS
GITHUB_TOKEN="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" # <--- CHANGE THIS (use Personal Access Token)
EMAIL="sriramreddydwarampudi.com"            # <--- CHANGE THIS
AUTHOR="Sri Ram"                   # <--- CHANGE THIS

# === SETUP ===
mkdir $REPO_NAME && cd $REPO_NAME

# main.py
cat > main.py <<EOF
from kivy.app import App
from kivy.uix.label import Label

class SridawApp(App):
    def build(self):
        return Label(text="🎵 Hello from music21!")

if __name__ == "__main__":
    SridawApp().run()
EOF

# buildozer.spec
cat > buildozer.spec <<EOF
[app]
title = Sridaw
package.name = sridaw
package.domain = org.sridaw
source.dir = .
source.include_exts = py,png,jpg,kv,atlas
version = 0.1
requirements = python3,kivy,music21
orientation = portrait
android.permissions = INTERNET

[buildozer]
log_level = 2
warn_on_root = 1
EOF

# GitHub Actions workflow
mkdir -p .github/workflows
cat > .github/workflows/build.yml <<EOF
name: Build Kivy APK

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'

    - name: Install dependencies
      run: |
        sudo apt update
        sudo apt install -y git zip unzip openjdk-17-jdk python3-pip python3-setuptools
        pip install --upgrade pip
        pip install buildozer cython

    - name: Install Android SDK/NDK
      run: |
        sudo apt install -y libncurses5 libstdc++6 zlib1g:i386
        buildozer android update

    - name: Build APK
      run: |
        buildozer android debug

    - name: Upload APK
      uses: actions/upload-artifact@v4
      with:
        name: sridaw.apk
        path: bin/*.apk
EOF

# === GIT INIT ===
git init
git config user.name "$AUTHOR"
git config user.email "$EMAIL"
git add .
git commit -m "🎉 Initial Kivy app with GitHub Actions APK builder"

# Add GitHub remote using PAT
git remote add origin https://$GITHUB_USER:$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git

# Push
git branch -M main
git push -u origin main

echo "✅ Done. Go to https://github.com/$GITHUB_USER/$REPO_NAME/actions to watch your APK build."



