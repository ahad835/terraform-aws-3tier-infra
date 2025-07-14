variable "ami_id" {
  description = "AMI ID for the backend instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Private subnet ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "source_sg_id" {
  description = "Security Group ID allowed to access backend (e.g. frontend SG)"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
