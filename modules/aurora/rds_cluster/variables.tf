########################
## Variables
########################

variable "cluster_identifier" {
  description = "The name of the cluster identifier"
}

variable "availability_zones" {
  description = "List of AZs"
  default = ["us-east-1a","us-east-1f"]
}

variable "db_name" {
  description = "The name of the Database"
}

variable "admin_user" {
  description = "User Name for the admin user"
  default = "admin"
}

variable "admin_password" {
  description = "Provide the password of the RDS Admin User"
}

variable "retention_period" {
  description = "No of days to retain the backup for"
  default = "7"
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default = "02:00-03:00"
}

variable "maintenance_window" {
  description = "The name of the environment"
  default = "wed:03:00-wed:04:00"
}


variable "cluster_identifier" {
  description = "The name of the Cluster Identifier"
}

variable "snapshot_identifier" {
  description = "Specify the snapshot identifier name"
}

variable "vpc_rds_security_group_id" {
  description = "The name of the environment"
}


variable "db_cluster_parameter_group_name" {
  description = "The name of the environment"
}

variable "engine" {
  description = "The name of the environment"
  default = ""
}

variable "engine_version" {
  description = "The name of the environment"
}

variable "environment_name" {
  description = "The name of the environment"
}

variable "vpc_name" {
  description = "The name of the VPC that the RDS cluster will be created in"
}

variable "vpc_rds_subnet_ids" {
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
}
