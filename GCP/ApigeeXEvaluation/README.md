# Apigee X - Evaluation Org Provisioning

To prepare your GCP project for running the terraform script, you’ll have to enable the following Google APIs:

apigee.googleapis.com
compute.googleapis.com
servicenetworking.googleapis.com

```console

PROJECT_ID=my-project-id

gcloud services enable compute.googleapis.com apigee.googleapis.com servicenetworking.googleapis.com --project $PROJECT_ID
```

Within the folder where you created/added the three files(main.tf, my-x-eval.tfvars, variables.tf) above you can then initialize your terraform module and inspect the generated plan:

```console
terraform init
terraform plan --var-file="my-x-eval.tfvars" -var=project_id=$PROJECT_ID
terraform apply --var-file="my-x-eval.tfvars" -var=project_id=$PROJECT_ID
```

Please note that the instance creation itself can take anywhere between 15-25 min plus the time to provision the environments for the first time.
Once the deployment is completed you should see a message saying:

```console
Apply complete! Resources: 12 added, 0 changed, 0 destroyed.
```

To find out the private endpoint for your Apigee instance you can either check the Admin > Instances page in the Apigee UI. Or run the following command:

```console
TOKEN=$(gcloud auth print-access-token) 
curl -H "Authorization: Bearer $TOKEN" \ 
  https://apigee.googleapis.com/v1/organizations/$PROJECT_ID/instances
``` 
