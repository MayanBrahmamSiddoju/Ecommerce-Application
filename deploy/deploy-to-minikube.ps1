# Deploy ecommerce app to local Minikube
# Usage: Open PowerShell and run in repo root:
# .\deploy\deploy-to-minikube.ps1

param()

# Ensure minikube is running
minikube status || minikube start

# Load images into minikube (if built locally)
minikube image load ecommerce-application-frontend:latest
minikube image load ecommerce-application-backend:latest

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/backend-deployment.yaml -n ecommerce
kubectl apply -f k8s/backend-service.yaml -n ecommerce
kubectl apply -f k8s/frontend-deployment.yaml -n ecommerce
kubectl apply -f k8s/frontend-service.yaml -n ecommerce
kubectl apply -f k8s/ingress.yaml -n ecommerce

Write-Output "Deployment applied. Use 'kubectl get all -n ecommerce' to inspect resources."