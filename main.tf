module "vpc" {
  for_each = var.vpc
  env = var.env
  subnets = each.value["subnets"]
  source = "./modules/vpc"
  cidr_block = each.value["cidr_block"]
  default_vpc = var.default_vpc
}

# module "db_instances" {
#   for_each = var.db_instances
#   source = "./modules/ec2"
#   env = var.env
#   instance_type = each.value["instance_type"]
#   app_port = each.value["app_port"]
#   component_name = each.key
#   zone_id = var.zone_id
#   domain_name = var.domain_name
#   vault_token = var.vault_token
#   volume_size = each.value["volume_size"]
# }

# module "app_instances" {
#   depends_on = [module.db_instances]
#   for_each = var.app_instances
#   source = "./modules/ec2"
#   env = var.env
#   instance_type = each.value["instance_type"]
#   app_port = each.value["app_port"]
#   component_name = each.key
#   zone_id = var.zone_id
#   domain_name = var.domain_name
#   vault_token = var.vault_token
#   volume_size = each.value["volume_size"]
# }
#
# module "web_instances" {
#   depends_on = [module.app_instances]
#   for_each = var.web_instances
#   source = "./modules/ec2"
#   env = var.env
#   instance_type = each.value["instance_type"]
#   app_port = each.value["app_port"]
#   component_name = each.key
#   zone_id = var.zone_id
#   domain_name = var.domain_name
#   vault_token = var.vault_token
#   volume_size = each.value["volume_size"]
# }

# module "eks" {
#   source = "./modules/eks"
#   env = var.env
#   subnet_ids = var.eks["subnet_ids"]
#   addons     = var.eks["addons"]
#   node_groups = var.eks["node_groups"]
#   access_entries = var.eks["access_entries"]
# }