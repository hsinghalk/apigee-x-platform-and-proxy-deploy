terraform {
  required_providers {
    apigee = {
      source  = "scastria/apigee"
      version = "~> 0.1.0"
    }
  }
}

provider "apigee" {
  access_token = var.access_token
  organization = var.organization
  server = "apigee.googleapis.com"
}