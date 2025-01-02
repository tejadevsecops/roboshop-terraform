env = "dev"
domain_name = "tejadevopsb81.icu"
zone_id = "Z06372633BKYPXSU4MUBQ"

db_instances = {
  mongodb = {
    app_port = 27017
    instance_type = "t2.micro"
  }
  mysql = {
    app_port = 3306
    instance_type = "t2.micro"
  }
  redis = {
    app_port = 6379
    instance_type = "t2.micro"
  }
  rabbitmq = {
    app_port = 5672
    instance_type = "t2.micro"
  }
}


app_instances = {
  catalogue = {
    app_port = 8080
    instance_type = "t2.micro"
  }
  user = {
    app_port = 8080
    instance_type = "t2.micro"
  }
  shipping = {
    app_port = 6379
    instance_type = "t2.micro"
  }
  cart = {
    app_port = 5672
    instance_type = "t2.micro"
  }
  payment = {
    app_port = 5672
    instance_type = "t2.micro"
  }
}

web_instances = {
  frontend = {
    app_port = 80
    instance_type = "t2.micro"
  }
}
