@echo off
setlocal enabledelayedexpansion

echo =======================================================
echo Git Remote Repository Setup & Push for Roll: 24MIS0384
echo =======================================================

set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/notification-system.git): "

if "%REPO_URL%"=="" (
    echo Error: Repository URL cannot be empty!
    pause
    exit /b 1
)

echo.
echo Initializing Git repository...
git init

echo Adding all files...
git add .

echo Committing initial project files...
git commit -m "feat: initial commit with v1, v2, v3 notification app for 24MIS0384"

echo Setting default branch to main...
git branch -M main

echo Adding remote origin: %REPO_URL%
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo Pushing main branch...
git push -u origin main

echo Creating and pushing branch 'v1' (Feature: Add - Create alert)...
git checkout -b v1
git push -u origin v1

echo Creating and pushing branch 'v2' (Feature: View - Show alerts)...
git checkout -b v2
git push -u origin v2

echo Creating and pushing branch 'v3' (Feature: Delete - Remove alert)...
git checkout -b v3
git push -u origin v3

echo Returning to main branch...
git checkout main

echo.
echo =======================================================
echo Success! All branches (main, v1, v2, v3) pushed to:
echo %REPO_URL%
echo =======================================================
pause
