env = "dev"
domain_name = "tejadevopsb81.icu"
zone_id = "Z04541522U2JZ9PMML5I8"
# bastion_nodes = ["172.31.47.208/32", "172.31.40.251/32"]
# kms_key_id = "arn:aws:kms:us-east-1:418272784676:key/52f66ad3-a70a-4ac4-aade-b0c69242e2ac"

db_instances = {
  mongodb = {
    app_port = 27017
    instance_type = "t2.micro"
    volume_size = 20
#    allow_cidr = ["10.0.0.128/26", "10.0.0.192/26"]
  }
  mysql = {
    app_port = 3306
    instance_type = "t2.micro"
    volume_size = 20
#    allow_cidr = ["10.0.0.128/26", "10.0.0.192/26"]
  }
  redis = {
    app_port = 6379
    instance_type = "t2.micro"
    volume_size = 20
#    allow_cidr = ["10.0.0.128/26", "10.0.0.192/26"]
  }
  rabbitmq = {
    app_port = 5672
    instance_type = "t2.micro"
    volume_size = 20
#    allow_cidr = ["10.0.0.128/26", "10.0.0.192/26"]
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
  # dispatch = {
  #   app_port = 8080
  #   instance_type = "t2.micro"
  #   volume_size = 30
  # }
}

web_instances = {
  frontend = {
    app_port = 80
    instance_type = "t2.micro"
    volume_size = 20
  }
}

# eks = {
#   # subnet_ids = ["subnet-036dd35a72f69e262", "subnet-00d1b598b3d5c3dd9"]
#   addons = {
#     vpc-cni = {}
# #    coredns = {}
#     kube-proxy = {}
#     eks-pod-identity-agent = {}
#   }
#   node_groups = {
#     ngone = {
#       desired_size = 2
#       max_size     = 5
#       min_size     = 2
#       capacity_type = "ON_DEMAND"
#       instance_types = ["t3.large"]
#     }
#   }
#   access_entries = {
#     workstation = {
#       principal_arn = "arn:aws:iam::418272784676:role/workstation-role"
#       kubernetes_groups = []
#       policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#       access_scope_type = "cluster"
#       access_scope_namespaces = []
#     }
#     ui = {
#       principal_arn = "arn:aws:iam::418272784676:root"
#       kubernetes_groups = []
#       policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#       access_scope_type = "cluster"
#       access_scope_namespaces = []
#     }
#   }
# }
#
# vpc = {
#   main = {
#     cidr_block = "10.0.0.0/24"
#     subnets = {
#       public-subnet-1 = {
#         cidr_block = "10.0.0.0/27"
#         az = "us-east-1a"
#         igw = true
#         subnet_group = "public"
#       }
#       public-subnet-2 = {
#         cidr_block = "10.0.0.32/27"
#         az = "us-east-1b"
#         igw = true
#         subnet_group = "public"
#       }
#       db-subnet-1 = {
#         cidr_block = "10.0.0.64/27"
#         az = "us-east-1a"
#         igw = false
#         subnet_group = "db"
#       }
#       db-subnet-2 = {
#         cidr_block = "10.0.0.96/27"
#         az = "us-east-1b"
#         igw = false
#         subnet_group = "db"
#       }
#       app-subnet-1 = {
#         cidr_block = "10.0.0.128/26"
#         az = "us-east-1a"
#         igw = false
#         subnet_group = "app"
#       }
#       app-subnet-2 = {
#         cidr_block = "10.0.0.192/26"
#         az = "us-east-1b"
#         igw = false
#         subnet_group = "app"
#       }
#     }
#   }
# }
#
# default_vpc = {
#   id = "vpc-0012cd57b4b34600a"
#   cidr = "172.31.0.0/16"
#   route_table = "rtb-06f0adc3685afd5eb"
# }