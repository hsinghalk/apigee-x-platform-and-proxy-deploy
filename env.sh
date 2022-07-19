export PROJECT="it-apx-poc" # The name of the GCP project
export NETWORK="default" # The network to use (will be created if it doesn't exist)
export LOCATION="us-east1-b" # The location for the Apigee X instance and analytics data
export MANAGED_DOMAIN_PREFIX="api" # The domain prefix to use for the Apigee X load balancer (using prefix.ip.nip.io)
# OPTIONAL parameters
export BILLING_ID="xyz"
# APIGEE PROXY & SHARED FLOWS
export ACCESS_TOKEN=`gcloud auth application-default print-access-token`
