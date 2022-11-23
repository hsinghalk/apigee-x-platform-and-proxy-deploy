## Apigee X platform deployment

This will help setup Apigee X with the deployment model in the diagram below. A GCP project, external load balancer with public hostname, managed instance groups, VPC and Apigee X instance will be created. 

![alt text](https://cloud.google.com/static/apigee/docs/api-platform/images/apigee-arch-diagrams/apigee-arch-a.png)

Click to here to open this repository in Google Cloud Shell, along with a tutorial to guide you through the shell deployment steps:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://ssh.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/hsinghalk/apigee-x-platform-and-proxy-deploy&cloudshell_git_branch=master)

```sh
# STEP 1: First edit the env.sh file with your environment variables
nano env.sh # or just open in your favorite editor

# STEP 2: Source env.sh to set environment variables
source env.sh

# STEP 3: cd into the apigee_platform directory
cd apigee_platform

# STEP 4: run terraform init on the configuration
terraform init

# STEP 5: apply terraform configuration to create a project, external load balancer with public hostname, managed instance groups, VPC and Apigee X instance
terraform apply --var-file=./setup.tfvars -var "project_id=$PROJECT" -var "project_create=true" -var "billing_account=$BILLING_ID"
```

## Apigee X proxy, sharedflow and other objects deployment

```sh
# STEP 1: First edit the env.sh file with your environment variables
nano env.sh # or just open in your favorite editor

# STEP 2: Source env.sh to set environment variables
source env.sh

# STEP 3: cd into the apigee_object directory
cd apigee_object

# STEP 4: run terraform init on the configuration
terraform init

# STEP 5: apply terraform configuration to deploy sharedflow and other objects to the selected organization
terraform apply -var "organization=$PROJECT" -var "access_token=$ACCESS_TOKEN"
```
