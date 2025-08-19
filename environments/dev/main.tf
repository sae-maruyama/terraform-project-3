# プロバイダー設定
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}

# VPCモジュールの呼び出し
module "vpc" {
  source = "../../modules/vpc"
  
  vpc_cidr     = var.vpc_cidr
  environment  = var.environment
  project_name = var.project_name
}

# Subnetモジュールの呼び出し
module "subnet" {
  source = "../../modules/subnet"
  
  vpc_id                = module.vpc.vpc_id
  environment           = var.environment
  project_name          = var.project_name
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  internet_gateway_id   = module.vpc.internet_gateway_id
}

# EC2モジュールの呼び出し
module "ec2" {
  source = "../../modules/ec2"
  
  subnet_id          = module.subnet.public_subnet_ids[0]
  security_group_ids = [module.vpc.default_security_group_id]
  instance_type      = var.instance_type
  environment        = var.environment
  project_name       = var.project_name
}