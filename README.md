# Terraform
This Guide will help you setup a Aks and ACR via Terraform and push Docker Image to AKS 


**Step 1 Mount Clouddrive**

clouddrive mount -s <SubId> -g <rgname> -n <StorageAccName> -f <FileService>

**Step 2Create Storage for tfstate**

az storage container create -n tfstate --account-name <StorageAccName>  --account-key <AccessKey>

Using Git 
**Step 3 Terraform Init**

terraform init -reconfigure -backend-config="storage_account_name=<StorageAccName>" -backend-config="container_name=tfstate" -backend-config="access_key=<AccessKey>" -backend-config="key=codelab.microsoft.tfstate"

**Step 4 Set Var Credentials**

export TF_VAR_client_id=SPID
export TF_VAR_client_secret=SPPass

**Step 5 Terraform Plan**


terraform plan -out out.plan

**Step 6 Terraform Plan**
terraform apply "out.plan"


#ACR Setup

**Step 1 Login to ACR**
az acr login -n <acr>

**Step 2 Login to Docker **

docker login <acr>.azurecr.io <Admin Credentials>

**Step 3  Docker Pull Image**

docker pull tiangolo/uvicorn-gunicorn-fastapi

**Step 4  Docker tag Image**

docker tag tiangolo/uvicorn-gunicorn-fastapi <acr>.azurecr.io/tekion/fastapi

**Step 5  Docker Pull Image**

docker push <acr>.azurecr.io/tekion/fastapi

**Step 6  Run Kubectl Command Apply Yaml for Deployment and Service**

kubectl apply -f "C:\Users\chsukhij\OneDrive - Microsoft\Desktop\fastapi.yaml"

Contact : Chirag Sukhija ( ChiragSukhija.com )
