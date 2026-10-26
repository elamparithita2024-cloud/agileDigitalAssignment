#!/usr/bin/env bash

REPO_URL="https://github.com/elamparithita2024-cloud/agileDigitalAssignment.git"

echo "======================================================="
echo "Pushing to GitHub: $REPO_URL"
echo "Roll No: 24MIS0384 (Notification App)"
echo "======================================================="

git init
git add .
git commit -m "feat: complete notification application for 24MIS0384 (v1, v2, v3)"

git branch -M main
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"
git push -u origin main --force

echo "Creating and pushing branch v1..."
git checkout -B v1
git push -u origin v1 --force

echo "Creating and pushing branch v2..."
git checkout -B v2
git push -u origin v2 --force

echo "Creating and pushing branch v3..."
git checkout -B v3
git push -u origin v3 --force

git checkout main

echo "Successfully pushed main, v1, v2, and v3 to $REPO_URL!"
