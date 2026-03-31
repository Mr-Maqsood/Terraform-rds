data "aws_secretsmanager_secret_version" "rds_db_version" {
  secret_id     = var.db_secret_name
  version_stage = "AWSCURRENT"
}

locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.rds_db_version.secret_string)
}