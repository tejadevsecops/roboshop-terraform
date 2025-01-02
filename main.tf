module "ec2" {
  for_each = var.instances
  source = "./modules/ec2"
  env = var.env
  instance_type = each.value["instance_type"]
  app_port = each.value["app_port"]
  component_name = each.key
}