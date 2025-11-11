Continuous Integration / Deployment (CI/CD)

This repo includes both GitHub Actions and CircleCI pipeline templates to run tests and build/push container images.

GitHub Actions
- Files:
  - .github/workflows/ci.yml — runs frontend & backend installs and tests on push/PR (explores environment variables).
  - .github/workflows/docker-k8s-deploy.yml — builds and pushes images to GitHub Container Registry and deploys to a Kubernetes cluster using KUBECONFIG secret (see below).

Required repository secrets for GitHub Actions (if you want to push to GHCR and deploy):
- GITHUB_TOKEN (provided automatically by Actions) — used for GHCR login by default
- KUBECONFIG — (base64-encoded kubeconfig) to allow Actions to run kubectl against your cluster

CircleCI
- File: .circleci/config.yml — builds & tests both projects and includes a job to build & push images to Docker Hub.
- Required CircleCI project environment variables:
  - DOCKERHUB_USERNAME
  - DOCKERHUB_PASSWORD

Local testing (Minikube)
- You can load locally built images into Minikube before applying manifests (script included): deploy/deploy-to-minikube.ps1

How to enable CI/CD
1. Choose a registry: Docker Hub or GitHub Container Registry (GHCR). Create an account and a repo if needed.
2. Add secrets to GitHub Actions (Settings → Secrets): add KUBECONFIG (base64) if you want remote deploy.
3. For CircleCI, add DOCKERHUB_USERNAME and DOCKERHUB_PASSWORD in your CircleCI project settings.
4. Push to the repository — CI workflows will run automatically on push and PRs.

Notes & security
- Do NOT commit secrets into the repo. Use secrets or env variables in CI.
- For production deployments, use a dedicated service account with minimal permissions in your cluster.
- The workflows provided are templates; adapt them to your environment (image names, registry, cluster config).
