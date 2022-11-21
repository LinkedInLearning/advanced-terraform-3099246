#GCP Command Reference
=====================

These gcloud commands are used throughout the course:

## 00_04_Exercise_Files
**Enable APIs:**
```
gcloud services enable iam.googleapis.com cloudresourcemanager.googleapis.com compute.googleapis.com

```

## 04_03_Terraform_Cloud_Setup
```
gcloud iam service-accounts create terraform-cloud \
    --description="SA for Terraform Cloud operations" \
    --display-name="terraform-cloud"

 gcloud projects add-iam-policy-binding [PROJECT_ID] \
    --member="serviceAccount:terraform-cloud@[PROJECT_ID].iam.gserviceaccount.com" \
    --role="roles/owner"

gcloud iam service-accounts keys create tf_sa_key \
    --iam-account=terraform-cloud@[PROJECT_ID].iam.gserviceaccount.com
```

## 04_05_GitOps_Setup
```
### DEV
gcloud config set project [PROJECT_ID_DEV]

gcloud services enable iam.googleapis.com cloudresourcemanager.googleapis.com compute.googleapis.com

gcloud iam service-accounts create terraform-cloud \
    --description="SA for Terraform Cloud operations" \
    --display-name="terraform-cloud"

 gcloud projects add-iam-policy-binding [PROJECT_ID_DEV] \
    --member="serviceAccount:terraform-cloud@[PROJECT_ID_DEV].iam.gserviceaccount.com" \
    --role="roles/owner"

gcloud iam service-accounts keys create tf_sa_key_dev \
    --iam-account=terraform-cloud@[PROJECT_ID_DEV].iam.gserviceaccount.com

### QA
gcloud config set project [PROJECT_ID_QA]

gcloud iam service-accounts create terraform-cloud \
    --description="SA for Terraform Cloud operations" \
    --display-name="terraform-cloud"

 gcloud projects add-iam-policy-binding [PROJECT_ID_QA] \
    --member="serviceAccount:terraform-cloud@[PROJECT_ID_QA].iam.gserviceaccount.com" \
    --role="roles/owner"

gcloud iam service-accounts keys create tf_sa_key_qa \
    --iam-account=terraform-cloud@[PROJECT_ID_QA].iam.gserviceaccount.com
```