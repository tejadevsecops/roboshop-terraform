locals {
  igw_enabled_subnets = [
    for subnet_key, subnet_value in var.subnets : subnet_key
    if subnet_value.igw == true
  ]
  az = distinct([for k, v in var.subnets : v.az])
  ngw_enabled_subnets = [
    for subnet_key, subnet_value in var.subnets : subnet_key
    if subnet_value.igw == false
  ]
}