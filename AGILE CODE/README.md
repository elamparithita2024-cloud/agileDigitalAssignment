# Notification Application (v1, v2, v3)
### Course: Agile Software Development & DevOps Continuous Delivery
### Roll Number: **24MIS0384**
### Project: **Notification**
* **GitHub Repository:** [https://github.com/elamparithita2024-cloud/agileDigitalAssignment](https://github.com/elamparithita2024-cloud/agileDigitalAssignment)

---

## 📌 Project Overview & Feature Matrix

| Version | Assigned Feature | Description | Port (NodePort) | Health / API Check |
| :---: | :--- | :--- | :---: | :--- |
| **`v1`** | **Add** | **Create alert:** Web form & API to submit new notifications (Title, Severity, Message). | `30001` | `http://localhost:30001/health` |
| **`v2`** | **View** | **Show alerts:** Displays a live feed of all alerts with status badges & timestamps. | `30002` | `http://localhost:30002/api/alerts` |
| **`v3`** | **Delete** | **Remove alert:** Delete individual notifications or clear all notifications. | `30003` | `http://localhost:30003/health` |

---

## 📁 Repository Directory Structure

```text
AGILE CODE/
├── v1/                               # Version 1: Add (Create Alert)
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── templates/
│       └── index.html
├── v2/                               # Version 2: View (Show Alerts)
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── templates/
│       └── index.html
├── v3/                               # Version 3: Delete (Remove Alert)
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── templates/
│       └── index.html
├── k8s/                              # Kubernetes Manifests
│   ├── v1-deployment.yaml            # Deployment & NodePort Service (30001)
│   ├── v2-deployment.yaml            # Deployment & NodePort Service (30002)
│   ├── v3-deployment.yaml            # Deployment & NodePort Service (30003)
│   └── all-deployments.yaml          # All 3 versions in a single manifest
├── Jenkinsfile                       # Jenkins CI/CD Pipeline script
├── requirements.txt
└── README.md
```

---

## 🚀 Quick Commands

### 1. Build Docker Images
```bash
docker build -t 24mis0384/notification-app:v1 ./v1
docker build -t 24mis0384/notification-app:v2 ./v2
docker build -t 24mis0384/notification-app:v3 ./v3
```

### 2. Push to Docker Hub
```bash
docker push 24mis0384/notification-app:v1
docker push 24mis0384/notification-app:v2
docker push 24mis0384/notification-app:v3
```

### 3. Deploy in Kubernetes
```bash
kubectl apply -f k8s/all-deployments.yaml
```

### 4. Verify Localhost
* **v1:** http://localhost:30001
* **v2:** http://localhost:30002
* **v3:** http://localhost:30003
