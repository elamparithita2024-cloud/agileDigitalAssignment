@echo off
echo ========================================================
echo Starting All 3 Versions on Localhost (Different Ports)
echo Roll No: 24MIS0384 (Notification App)
echo ========================================================

echo.
echo Stopping any existing containers...
docker rm -f notification-v1 notification-v2 notification-v3 2>nul

echo.
echo [1/3] Starting Version 1 on http://localhost:5001 ...
docker run -d -p 5001:5000 --name notification-v1 elamparithi2024/notification-app:v1

echo.
echo [2/3] Starting Version 2 on http://localhost:5002 ...
docker run -d -p 5002:5000 --name notification-v2 elamparithi2024/notification-app:v2

echo.
echo [3/3] Starting Version 3 on http://localhost:5003 ...
docker run -d -p 5003:5000 --name notification-v3 elamparithi2024/notification-app:v3

echo.
echo ========================================================
echo ALL 3 VERSIONS ARE RUNNING CONCURRENTLY ON LOCALHOST!
echo --------------------------------------------------------
echo Version 1 (Add - Create alert):    http://localhost:5001
echo Version 2 (View - Show alerts):    http://localhost:5002
echo Version 3 (Delete - Remove alert): http://localhost:5003
echo ========================================================
echo.
echo Opening all 3 tabs in your default browser...
start http://localhost:5001
start http://localhost:5002
start http://localhost:5003
pause
