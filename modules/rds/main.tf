#Subnet Group
resource "aws_db_subnet_group" "rds-subnet_group" {
    name = var.subnet_group_name
    description = "subnet group for Mysql RDSinstance"
    subnet_ids = var.subnet_ids
    tags = {
        Name  = "app-rds-subnet-group"
        Environment ="dev"
        Project = "RDS-Automation"
    }
  
}
#security group
resource "aws_security_group" "rds_sg" {
    name = var.sg_group_name
    vpc_id = var.vpc_id

    ingress  {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = var.allowed_cidr_blocks
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.allowed_cidr_blocks
    }
    tags = {
      Name = "app-rds-sg-group"
      Environment = "dev"
      Project = "RDS-Automation"

    }
  
}

#RDS MYSQL instance
resource "aws_db_instance" "MySQL" {
    identifier = var.db_identifier
    engine = var.db_engine
    engine_version = var.db_engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    db_name = var.db_name
    username = "admin"
    password = "admin123"

    multi_az = false
    publicly_accessible = false
    backup_retention_period = 1
    skip_final_snapshot = true
    deletion_protection = false
    vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
    db_subnet_group_name = aws_db_subnet_group.rds-subnet_group.name

    tags = {
        Name = "app-mysql-db"
        Environment = "dev"
        Project = "RDS-Automation"
    }
    
  
}