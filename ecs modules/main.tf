module "vpc_vpc-03622508ccabb8719" {
  source               = "./vpc"
  vpc_cidr             = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "vpc_vpc-040873ce6d24dfd97" {
  source               = "./vpc"
  vpc_cidr             = "10.222.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "dev_cgp_vpc"
    "Project"     = "CGP"
    "Region"      = "us-east-1"
    "Environment" = "Dev"
  }
}


module "subnet_subnet-0644cb7c5481a6d9e" {
  source                  = "./subnet"
  cidr_block              = "172.31.64.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1f"
}

module "subnet_subnet-0c91b0a51ebaa32a8" {
  source                  = "./subnet"
  cidr_block              = "10.222.32.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1c"
  tags = {
    "Name"        = "public_us-east-1c_dev_cgp"
    "Project"     = "CGP"
    "Region"      = "us-east-1"
    "Environment" = "Dev"
  }
}

module "subnet_subnet-0d2fa7f51fa90f14e" {
  source                  = "./subnet"
  cidr_block              = "10.222.16.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1b"
  tags = {
    "Region"      = "us-east-1"
    "Environment" = "Dev"
    "Name"        = "public_us-east-1b_dev_cgp"
    "Project"     = "CGP"
  }
}

module "subnet_subnet-09c8b90127885ddfe" {
  source                  = "./subnet"
  cidr_block              = "172.31.80.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1d"
}

module "subnet_subnet-0e4ecbe4a83269b14" {
  source                  = "./subnet"
  cidr_block              = "10.222.0.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1a"
  tags = {
    "Project"     = "CGP"
    "Environment" = "Dev"
    "Region"      = "us-east-1"
    "Name"        = "public_us-east-1a_dev_cgp"
  }
}

module "subnet_subnet-0ca9c430f6e141541" {
  source                  = "./subnet"
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1c"
}

module "subnet_subnet-0d815edf215e9a361" {
  source                  = "./subnet"
  cidr_block              = "10.222.128.0/18"
  map_public_ip_on_launch = false
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1b"
  tags = {
    "Region"      = "us-east-1"
    "Name"        = "private_us-east-1b_dev_cgp"
    "Project"     = "CGP"
    "Environment" = "Dev"
  }
}

module "subnet_subnet-00dfe8b6613073e0d" {
  source                  = "./subnet"
  cidr_block              = "172.31.48.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1e"
}

module "subnet_subnet-088087f4cff88ba14" {
  source                  = "./subnet"
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1a"
}

module "subnet_subnet-0182aa467d8e9fdc4" {
  source                  = "./subnet"
  cidr_block              = "10.222.64.0/18"
  map_public_ip_on_launch = false
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1a"
  tags = {
    "Environment" = "Dev"
    "Region"      = "us-east-1"
    "Project"     = "CGP"
    "Name"        = "private_us-east-1a_dev_cgp"
  }
}

module "subnet_subnet-0b2b80444dc19cf85" {
  source                  = "./subnet"
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = module.vpc_vpc-03622508ccabb8719.id
  az                      = "us-east-1b"
}

module "subnet_subnet-05f5e4f214a79b646" {
  source                  = "./subnet"
  cidr_block              = "10.222.192.0/18"
  map_public_ip_on_launch = false
  vpc_id                  = module.vpc_vpc-040873ce6d24dfd97.id
  az                      = "us-east-1c"
  tags = {
    "Environment" = "Dev"
    "Region"      = "us-east-1"
    "Project"     = "CGP"
    "Name"        = "private_us-east-1c_dev_cgp"
  }
}

module "ecs_cluster" {
  source       = "./ecs-cluster"
  cluster_name = "myapp-cluster"
}


module "ecs_task_definition" {
  source             = "./task-definition"
  task_family        = "testapp-task"
  fargate_cpu        = var.fargate_cpu
  fargate_memory     = var.fargate_memory
  app_image          = var.app_image
  app_port           = var.app_port
}

module "ecs_service" {
  source               = "./ecs-service"
  service_name         = "testapp-service"
  cluster_id           = module.ecs_cluster.cluster_id
  ecs_task_definition_arn = module.ecs_task_definition.task_definition_arn
  desired_count        = var.app_count
  subnet_ids           = [module.subnet_subnet-0c91b0a51ebaa32a8.id]
  assign_public_ip     = true
}