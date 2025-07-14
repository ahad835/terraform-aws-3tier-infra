region              = "us-east-1"
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]
ami_id         = "ami-07041441b708acbd6"
instance_type  = "t3.micro"
key_name       = "your-ec2-keypair-name"
#SSH IP ALLOW EC2_FRONTEND
ssh_cidr_block = "YOUR.PUBLIC.IP.ADDR/32"
# RDS variables
db_name    = "myappdb"
username   = "dbadmin"
password   = "PASSWORD"