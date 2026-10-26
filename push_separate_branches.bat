@echo off
set REPO_URL=https://github.com/elamparithita2024-cloud/agileDigitalAssignment.git

echo ======================================================================
echo Pushing to GitHub with SEPARATE COMMITS AND BRANCHES
echo Roll No: 24MIS0384 (Notification App)
echo Repository: %REPO_URL%
echo ======================================================================

echo.
echo [Step 1] Initializing Git repository...
git init
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo.
echo ======================================================================
echo [Step 2] Creating Branch 'v1' with Separate Commit for Feature: Add
echo ======================================================================
git checkout -B v1
git add v1/ requirements.txt .gitignore
git commit -m "feat(v1): Add - Create alert (Roll No: 24MIS0384)"
git push -u origin v1 --force

echo.
echo ======================================================================
echo [Step 3] Creating Branch 'v2' with Separate Commit for Feature: View
echo ======================================================================
git checkout -B v2
git add v2/
git commit -m "feat(v2): View - Show alerts (Roll No: 24MIS0384)"
git push -u origin v2 --force

echo.
echo ======================================================================
echo [Step 4] Creating Branch 'v3' with Separate Commit for Feature: Delete
echo ======================================================================
git checkout -B v3
git add v3/
git commit -m "feat(v3): Delete - Remove alert (Roll No: 24MIS0384)"
git push -u origin v3 --force

echo.
echo ======================================================================
echo [Step 5] Creating Branch 'main' with All Files, K8s, and Jenkinsfile
echo ======================================================================
git checkout -B main
git add .
git commit -m "feat(main): complete Notification DevOps project with Jenkinsfile and K8s manifests (24MIS0384)"
git push -u origin main --force

echo.
echo ======================================================================
echo SUCCESS! All separate branches and commits are pushed to GitHub:
echo - Branch 'v1' -> Commit: feat(v1): Add - Create alert
echo - Branch 'v2' -> Commit: feat(v2): View - Show alerts
echo - Branch 'v3' -> Commit: feat(v3): Delete - Remove alert
echo - Branch 'main' -> Full project repository
echo ======================================================================
pause
