provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  region              = var.region
  azs                 = ["${var.region}a", "${var.region}b"]
}

module "ec2_frontend" {
  source           = "../../modules/ec2_frontend"
  ami_id           = "ami-07041441b708acbd6"
  instance_type    = "t3.micro"
  subnet_id        = module.vpc.public_subnet_ids[0]
  vpc_id           = module.vpc.vpc_id
  ssh_cidr_block   = "YOUR.PUBLIC.IP.ADDR/32"
  key_name         = "your-keypair-name"
}

module "ec2_backend" {
  source         = "../../modules/ec2_backend"
  ami_id         = "ami-07041441b708acbd6"
  instance_type  = "t3.micro"
  subnet_id      = module.vpc.private_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
  key_name       = var.key_name
  source_sg_id   = module.ec2_frontend.frontend_sg_id
}

module "rds_postgres" {
  source          = "../../modules/rds_postgres"
  vpc_id          = module.vpc.vpc_id
  db_subnet_ids   = module.vpc.private_subnet_ids
  db_name         = "myappdb"
  username        = "dbadmin"
  password        = "SuperSecurePassword123!" # move to tfvars or secrets store later
  instance_class  = "db.t3.micro"
  backend_sg_id   = module.ec2_backend.backend_sg_id
}
