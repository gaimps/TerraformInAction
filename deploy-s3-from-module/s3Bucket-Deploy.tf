provider "aws" {
  region  = "ca-central-1"
}
 
module "s3backend" {
  source = "github.com/gaimps/terraform-aws-s3backend"
  namespace     = "pokemon"
}
 
output "s3backend_config" {
  value = module.s3backend.config
}