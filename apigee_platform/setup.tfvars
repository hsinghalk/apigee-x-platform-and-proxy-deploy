ax_region = "us-east1"

apigee_environments = ["dev", "test"]

apigee_instances = {
  use1-instance = {
    region       = "us-east1"
    ip_range     = "10.0.0.0/22"
    environments = ["dev", "test"]
  }
}

apigee_envgroups = {
  api = {
    environments = ["dev", "test"]
    hostnames    = ["test.api.example.com"]
  }
}

network = "apigee-network"

exposure_subnets = [
  {
    name               = "apigee-exposure"
    ip_cidr_range      = "10.100.0.0/24"
    region             = "us-east1"
    secondary_ip_range = null
  }
]

peering_range = "10.0.0.0/22"
support_range = "10.1.0.0/28"
