#!/usr/bin/env bash

echo "======================================================="
echo "Git Remote Repository Setup & Push for Roll: 24MIS0384"
echo "======================================================="

read -p "Enter your GitHub Repository URL: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "Error: Repository URL cannot be empty!"
    exit 1
fi

git init
git add .
git commit -m "feat: initial commit with v1, v2, v3 notification app for 24MIS0384"

git branch -M main
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"
git push -u origin main

echo "Pushing branch v1..."
git checkout -b v1
git push -u origin v1

echo "Pushing branch v2..."
git checkout -b v2
git push -u origin v2

echo "Pushing branch v3..."
git checkout -b v3
git push -u origin v3

git checkout main

echo "All branches pushed successfully to $REPO_URL!"
