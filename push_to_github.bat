@echo off
set REPO_URL=https://github.com/elamparithita2024-cloud/agileDigitalAssignment.git

echo =======================================================
echo Pushing to GitHub: %REPO_URL%
echo Roll No: 24MIS0384 (Notification App)
echo =======================================================

echo.
echo [1/6] Initializing local Git repository...
git init

echo [2/6] Staging all files...
git add .

echo [3/6] Committing codebase...
git commit -m "feat: complete notification application for 24MIS0384 (v1, v2, v3)"

echo [4/6] Setting main branch and remote origin...
git branch -M main
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo [5/6] Pushing main branch...
git push -u origin main --force

echo.
echo [6/6] Creating and pushing required version branches...
git checkout -B v1
git push -u origin v1 --force

git checkout -B v2
git push -u origin v2 --force

git checkout -B v3
git push -u origin v3 --force

git checkout main

echo.
echo =======================================================
echo Successfully pushed main, v1, v2, and v3 to GitHub!
echo Repository: %REPO_URL%
echo =======================================================
pause
