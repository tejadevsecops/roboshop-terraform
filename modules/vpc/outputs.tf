output "igw" {
  value = local.igw_enabled_subnets
}

output "db_subnets" {
  value = [for subnet_key, subnet_value in aws_subnet.main : subnet_value.id if subnet_value.tags["subnet_group"] == "db"]
}