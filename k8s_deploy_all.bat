@echo off
echo ==============================================
echo Deploying Notification App (v1, v2, v3) to K8s
echo Roll No: 24MIS0384
echo ==============================================

kubectl apply -f k8s/all-deployments.yaml

echo.
echo Deployments:
kubectl get deployments -l app=notification

echo.
echo Pods:
kubectl get pods -l app=notification

echo.
echo Services:
kubectl get svc -l app=notification

echo.
echo Access URLs:
echo v1: http://localhost:30001
echo v2: http://localhost:30002
echo v3: http://localhost:30003
pause
