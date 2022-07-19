
data "archive_file" "petstore-v2" {
  type = "zip"
  source_dir = "${path.module}/proxies/petstore-v2"
  output_path = "${path.module}/proxies/petstore-v2.zip"
}
resource "apigee_proxy" "petstore-v2" {
  name = "petstore-v2"
  bundle = data.archive_file.petstore-v2.output_path
  bundle_hash = data.archive_file.petstore-v2.output_base64sha256
}
resource "apigee_proxy_deployment" "petstore-v2" {
  proxy_name = apigee_proxy.petstore-v2.name
  environment_name = "dev"
  revision = apigee_proxy.petstore-v2.revision
}
resource "apigee_product" "petstore-v2" {
  name = "petstore-v2"
  display_name = "petstore-v2 product"
  auto_approval_type = true
  environments = [
    "dev"
  ]
  attributes = {
    access = "public"
  }
  
  operation {
    api_source = apigee_proxy.petstore-v2.name
    path       = "/**"
    methods    = ["GET","POST","PUT","DELETE"]
    
  }
  
  
    quota           = 3
    quota_interval  = 1
    quota_time_unit = "minute"


  scopes = [
    "write:pets",
    "read:pets"
  ]
}
resource "apigee_developer" "adelekeia" {
  email = "azeez@example.com"
  first_name = "Azeez"
  last_name = "Adeleke"
  user_name = "adelekeia"
}
resource "apigee_developer_app" "petstore-v2" {
  developer_email = apigee_developer.adelekeia.email
  name = "petstore-v2-app"
  attributes = {
    DisplayName = "petstore-v2 app"
  }
}
resource "apigee_developer_app_credential" "petstore-v2" {
  developer_email = apigee_developer.adelekeia.email
  developer_app_name = apigee_developer_app.petstore-v2.name
  consumer_key = "testImportedKey"
  consumer_secret = "testImportedSecret"
  api_products = [
    apigee_product.petstore-v2.name
  ]
}