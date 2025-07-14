variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID (for security group)"
  type        = string
}

variable "ssh_cidr_block" {
  description = "Allowed CIDR for SSH (port 22)"
  type        = string
}

variable "key_name" {
  description = "Key pair name to use for SSH"
  type        = string
}
