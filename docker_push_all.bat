@echo off
set DOCKER_USER=24mis0384
echo ==============================================
echo Pushing Docker Images for Roll No: %DOCKER_USER%
echo ==============================================

echo [1/3] Pushing v1...
docker push %DOCKER_USER%/notification-app:v1

echo [2/3] Pushing v2...
docker push %DOCKER_USER%/notification-app:v2

echo [3/3] Pushing v3...
docker push %DOCKER_USER%/notification-app:v3

echo Push complete!
pause
