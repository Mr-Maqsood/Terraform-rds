variable "db_secret_name" {
  default = "dev/mysql/my-app"
  type    = string
}

############################################
# VPC Configuration
############################################
variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
  default = "vpc-04651e5956909f974"
}
variable "subnet_group_name" {
  type = string
  default = "app-rds-subnet-group-prod"
  
}
variable "sg_group_name" {
  type = string
  default = "app-rds-sg-prd"
  
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS subnet group"
  type        = list(string)
  default = [ "subnet-08641034542523a33","subnet-0fdc982bf74633074","subnet-0a5f1401b0783d582" ]
}

############################################
# RDS Configuration
############################################
variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "app-mysql-db"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdbprod"
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.4.7" 
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type (gp2/gp3)"
  type        = string
  default     = "gp2"
}

############################################
# Security Group
############################################
variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for DB access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}



############################################
# Tags
############################################
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "RDS-Automation"
}