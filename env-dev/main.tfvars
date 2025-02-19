env = "dev"
domain_name = "tejadevopsb81.icu"
zone_id = "Z10165773L4FEVYHDJOSY"

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
  subnet_ids = ["subnet-036dd35a72f69e262", "subnet-00d1b598b3d5c3dd9"]
  addons = {
    vpc-cni = {}
#    coredns = {}
    kube-proxy = {}
    eks-pod-identity-agent = {}
  }
  node_groups = {
    g1 = {
      desired_size = 2
      max_size     = 5
      min_size     = 2
      capacity_type = "ON_DEMAND"
      instance_types = ["t3.large"]
    }
  }
  access_entries = {
    workstation = {
      principal_arn = "arn:aws:iam::418272784676:role/workstation-role"
      kubernetes_groups = []
      policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type = "cluster"
      access_scope_namespaces = []
    }
    ui = {
      principal_arn = "arn:aws:iam::418272784676:root"
      kubernetes_groups = []
      policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type = "cluster"
      access_scope_namespaces = []
    }
  }
}

vpc = {
  main = {
    cidr_block = "10.0.0.0/24"
  }
}