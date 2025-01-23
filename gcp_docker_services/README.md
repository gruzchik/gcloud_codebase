codebase was created with https://www.cloudskillsboost.google for "Deploying Apps to Google Cloud"

1. To run task 1 and 2:
```
docker build -t test-python .
docker run --rm -p 8080:8080 test-python
```
2. For task3 "Deploy to App Engine"
```
gcloud app create --region=Region
gcloud app deploy --version=one --quiet
```
# add app.yaml with code: runtime: python39
```
gcloud app deploy --version=two --no-promote --quiet
```
3. for Kubernetes
```
kubectl get nodes
```
# add file kubernetes-config.yaml
```
gcloud artifacts repositories create devops-demo \
    --repository-format=docker \
    --location="REGION"

gcloud auth configure-docker "REGION"-docker.pkg.dev

gcloud builds submit --tag "REGION"-docker.pkg.dev/$DEVSHELL_PROJECT_ID/devops-demo/devops-image:v0.2 .

kubectl apply -f kubernetes-config.yaml
kubectl get pods
kubectl get services
```
4. for Cloud Run
```
gcloud builds submit --tag europe-west1-docker.pkg.dev/$DEVSHELL_PROJECT_ID/devops-demo/cloud-run-image:v0.1 .
```