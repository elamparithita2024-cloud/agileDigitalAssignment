#!/usr/bin/env bash

REPO_URL="https://github.com/elamparithita2024-cloud/agileDigitalAssignment.git"

echo "======================================================================"
echo "Pushing to GitHub with SEPARATE COMMITS AND BRANCHES"
echo "Roll No: 24MIS0384 (Notification App)"
echo "Repository: $REPO_URL"
echo "======================================================================"

git init
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"

# Step 1: Branch v1 with separate commit
echo "==> Creating branch v1..."
git checkout -B v1
git add v1/ requirements.txt .gitignore
git commit -m "feat(v1): Add - Create alert (Roll No: 24MIS0384)"
git push -u origin v1 --force

# Step 2: Branch v2 with separate commit
echo "==> Creating branch v2..."
git checkout -B v2
git add v2/
git commit -m "feat(v2): View - Show alerts (Roll No: 24MIS0384)"
git push -u origin v2 --force

# Step 3: Branch v3 with separate commit
echo "==> Creating branch v3..."
git checkout -B v3
git add v3/
git commit -m "feat(v3): Delete - Remove alert (Roll No: 24MIS0384)"
git push -u origin v3 --force

# Step 4: Branch main with all files
echo "==> Creating branch main..."
git checkout -B main
git add .
git commit -m "feat(main): complete Notification DevOps project with Jenkinsfile and K8s manifests (24MIS0384)"
git push -u origin main --force

echo "======================================================================"
echo "SUCCESS! All separate branches and commits are pushed to GitHub."
echo "======================================================================"
