#!/bin/bash

# ─────────────────────────────────────────────
#  Music & Movie Trivia — One-Click Publisher
#  Run this in Git Bash from your project folder
# ─────────────────────────────────────────────

echo ""
echo "🎵🎬 Music & Movie Trivia — Publisher"
echo "────────────────────────────────────────"

# Check we're in the right folder
if [ ! -f "index.html" ]; then
  echo ""
  echo "ERROR: index.html not found here."
  echo "Make sure you run this from inside your"
  echo "MusicMovieTrivia.com project folder."
  echo ""
  exit 1
fi

# Ask for a commit message
echo ""
echo "What changed? (press Enter for default message)"
read -p " > " MSG

if [ -z "$MSG" ]; then
  MSG="Update game $(date '+%Y-%m-%d %H:%M')"
fi

echo ""
echo "Publishing..."
echo ""

# Stage all relevant files, commit and push
git add index.html
git add README.md 2>/dev/null
git add .gitignore 2>/dev/null
git commit -m "$MSG"
git push origin main

# Check if push succeeded
if [ $? -eq 0 ]; then
  echo ""
  echo "────────────────────────────────────────"
  echo "SUCCESS! Published to GitHub."
  echo ""
  echo "Live site:"
  echo "https://hdmultimedia.github.io/MusicMovieTrivia.com"
  echo ""
  echo "GitHub Pages updates within about 60 seconds."
  echo "────────────────────────────────────────"
else
  echo ""
  echo "────────────────────────────────────────"
  echo "FAILED. Check your internet connection"
  echo "or Personal Access Token and try again."
  echo "────────────────────────────────────────"
fi
