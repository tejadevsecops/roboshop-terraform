output "igw" {
  value = local.igw_enabled_subnets
}

output "db_subnets" {
  value = [for subnet_key, subnet_value in var.subnets : subnet_key if subnet_value.subnet_group == "db"]
}