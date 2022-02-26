module "vpc" {
  source     = "github.com/terraform-google-modules/cloud-foundation-fabric/modules/net-vpc"
  project_id = var.project_id
  name       = var.network
  psn_ranges = ["10.0.0.0/16"]
}

module "apigee" {
  source              = "github.com/terraform-google-modules/cloud-foundation-fabric/modules/apigee-organization"
  project_id          = var.project_id
  analytics_region    = var.analytics_region
  runtime_type        = "CLOUD"
  authorized_network  = module.vpc.network.id
  apigee_environments = var.apigee_environments
  apigee_envgroups    = var.apigee_envgroups
}

module "apigee-x-instance" {
  source              = "github.com/terraform-google-modules/cloud-foundation-fabric/modules/apigee-x-instance"
  apigee_org_id       = module.apigee.org_id
  name                = "my-eval-instance"
  region              = var.runtime_region
  ip_range           = "10.0.0.0/22"
  apigee_environments = var.apigee_environments
}
