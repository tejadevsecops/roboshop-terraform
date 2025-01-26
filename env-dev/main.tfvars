env = "dev"
domain_name = "tejadevopsb81.icu"
zone_id = "Z06372633BKYPXSU4MUBQ"

db_instances = {
  mongodb = {
    app_port = 27017
    instance_type = "t2.micro"
    volume_size = 20
  }
  mysql = {
    app_port = 3306
    instance_type = "t2.micro"
    volume_size = 20
  }
  redis = {
    app_port = 6379
    instance_type = "t2.micro"
    volume_size = 20
  }
  rabbitmq = {
    app_port = 5672
    instance_type = "t2.micro"
    volume_size = 20
  }
}


app_instances = {
  catalogue = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
  user = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
  shipping = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
  cart = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
  payment = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
  dispatch = {
    app_port = 8080
    instance_type = "t2.micro"
    volume_size = 30
  }
}

web_instances = {
  frontend = {
    app_port = 80
    instance_type = "t2.micro"
    volume_size = 20
  }
}

eks = {
  subnet_ids = ["subnet-0f4396c6f64a29f1d", "subnet-00cbe417ef8fb7f59"]
  addons = {
    vpc-cni = {}

    kube-proxy = {}
  }
  node_groups = {
    g1 = {
      desired_size = 1
      max_size     = 2
      min_size     = 1
      capacity_type = "SPOT"
      instance_types = ["t3.large"]
    }
  }
  access_entries = {
    workstation = {
      principal_arn = "arn:aws:iam::021891599381:role/workstation-role"
      kubernetes_groups = []
      policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type = "cluster"
      access_scope_namespaces = []
    }
  }
}