Kubernetes manifests for Ecommerce-Application

Included manifests:
- namespace.yaml — creates `ecommerce` namespace
- backend-deployment.yaml — backend Deployment
- backend-service.yaml — backend ClusterIP Service
- frontend-deployment.yaml — frontend Deployment
- frontend-service.yaml — frontend ClusterIP Service
- ingress.yaml — Ingress to expose frontend (requires nginx ingress controller)

Usage (minikube / k3s / any cluster):

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/backend-deployment.yaml -n ecommerce
kubectl apply -f k8s/backend-service.yaml -n ecommerce
kubectl apply -f k8s/frontend-deployment.yaml -n ecommerce
kubectl apply -f k8s/frontend-service.yaml -n ecommerce
kubectl apply -f k8s/ingress.yaml -n ecommerce

Notes:
- Ensure images `ecommerce-application-frontend:latest` and `ecommerce-application-backend:latest` are available in the cluster.
- For a remote cluster, push images to a registry and update `image:` fields to the registry path.
- In a local cluster (minikube) you can load images with `minikube image load <image>`.
