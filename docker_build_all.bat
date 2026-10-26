@echo off
set DOCKER_USER=24mis0384
echo ==============================================
echo Building Docker Images for Roll No: %DOCKER_USER%
echo Project: Notification (v1, v2, v3)
echo ==============================================

echo [1/3] Building v1...
docker build -t %DOCKER_USER%/notification-app:v1 ./v1

echo [2/3] Building v2...
docker build -t %DOCKER_USER%/notification-app:v2 ./v2

echo [3/3] Building v3...
docker build -t %DOCKER_USER%/notification-app:v3 ./v3

echo Build complete! List of created images:
docker images | findstr notification-app
pause
