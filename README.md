# Notification Application (v1, v2, v3)
### Course: Agile Software Development & DevOps Continuous Delivery
### Roll Number: **24MIS0384**
### Project: **Notification**

---

## 📌 Project Overview & Feature Matrix

* **GitHub Repository:** [https://github.com/elamparithita2024-cloud/agileDigitalAssignment](https://github.com/elamparithita2024-cloud/agileDigitalAssignment)


| Version | Assigned Feature | Description | Port (NodePort) | Health / API Check |
| :---: | :--- | :--- | :---: | :--- |
| **`v1`** | **Add** | **Create alert:** Web form & API to submit new notifications (Title, Severity, Message). | `30001` | `http://localhost:30001/health` |
| **`v2`** | **View** | **Show alerts:** Displays a live feed of all alerts with status badges & timestamps. | `30002` | `http://localhost:30002/api/alerts` |
| **`v3`** | **Delete** | **Remove alert:** Delete individual notifications or clear all notifications. | `30003` | `http://localhost:30003/health` |

---

## 📁 Repository Directory Structure

```text
AGILE/
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

## 🚀 Step-by-Step Execution Guide

### Step 1: Version Control (Git & GitHub Branches)
Initialize git and create commits/branches for each version:

```bash
git init
git add .
git commit -m "feat(init): Notification application codebase for 24MIS0384"

# Create separate branches for each version requirement
git branch -M main

# Branch for v1
git checkout -b v1
git commit --allow-empty -m "Release v1: Add - Create alert feature"
git push -u origin v1

# Branch for v2
git checkout -b v2
git commit --allow-empty -m "Release v2: View - Show alerts feature"
git push -u origin v2

# Branch for v3
git checkout -b v3
git commit --allow-empty -m "Release v3: Delete - Remove alert feature"
git push -u origin v3

# Back to main
git checkout main
git push -u origin main
```

---

### Step 2: Docker Containerization & Docker Hub Push

Replace `<YOUR_DOCKERHUB_USERNAME>` with your Docker Hub ID (e.g. `24mis0384`):

```bash
# Log in to Docker Hub
docker login

# Build Docker images for each version
docker build -t <YOUR_DOCKERHUB_USERNAME>/notification-app:v1 ./v1
docker build -t <YOUR_DOCKERHUB_USERNAME>/notification-app:v2 ./v2
docker build -t <YOUR_DOCKERHUB_USERNAME>/notification-app:v3 ./v3

# Push images to Docker Hub
docker push <YOUR_DOCKERHUB_USERNAME>/notification-app:v1
docker push <YOUR_DOCKERHUB_USERNAME>/notification-app:v2
docker push <YOUR_DOCKERHUB_USERNAME>/notification-app:v3
```

---

### Step 3: Run via Jenkins Pipeline (CI/CD)

1. Open Jenkins (`http://localhost:8080`).
2. Add Docker Hub Credentials under **Manage Jenkins > Credentials** with ID `dockerhub-credentials`.
3. Create a **Pipeline** job:
   - Select **Pipeline script from SCM** (Git) or paste the contents of `Jenkinsfile`.
   - Run the pipeline by selecting `Build with Parameters` (Choose `all` or specific versions `v1`, `v2`, `v3`).

---

### Step 4: Deploy in Kubernetes (K8s)

Deploy all three versions simultaneously:

```bash
kubectl apply -f k8s/all-deployments.yaml
```

Verify Pods and Services:

```bash
kubectl get deployments
kubectl get pods -l app=notification
kubectl get svc -l app=notification
```

Expected output:
```text
NAME                     READY   STATUS    RESTARTS   AGE
notification-v1-...      1/1     Running   0          30s
notification-v2-...      1/1     Running   0          30s
notification-v3-...      1/1     Running   0          30s

NAME                      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
notification-v1-service   NodePort   10.96.xxx.xxx   <none>        5000:30001/TCP   30s
notification-v2-service   NodePort   10.96.xxx.xxx   <none>        5000:30002/TCP   30s
notification-v3-service   NodePort   10.96.xxx.xxx   <none>        5000:30003/TCP   30s
```

---

### Step 5: Verification & Evaluation via Localhost

Open your web browser and test all 3 versions concurrently:

* **Version 1 (Add Alert):**  
  👉 **`http://localhost:30001`**  
  *Feature:* Fill in the form and create a notification.

* **Version 2 (View Alerts):**  
  👉 **`http://localhost:30002`**  
  *Feature:* Add notifications and view them live in the dashboard feed.

* **Version 3 (Delete Alerts):**  
  👉 **`http://localhost:30003`**  
  *Feature:* Add, view, delete individual alerts, or click "Clear All" to purge alerts.

*(Note for Minikube users: If `localhost:<nodeport>` is not directly accessible, run `minikube service notification-v1-service`, `minikube service notification-v2-service`, and `minikube service notification-v3-service` or `minikube tunnel`).*
