variable "vpc_id" {
  description = "VPC ID for RDS subnet group"
  type        = string
}

variable "db_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_name" {
  type        = string
  description = "DB name"
}

variable "username" {
  type        = string
  description = "DB username"
}

variable "password" {
  type        = string
  description = "DB password"
  sensitive   = true
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS instance class"
}

variable "backend_sg_id" {
  description = "SG ID of backend EC2 (allowed inbound to DB)"
  type        = string
}
