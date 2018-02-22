
########################
## Variables
########################

variable "cluster_sizer" {
  description = "Total no of clusters to spinr"
}

variable "environment_name" {
  description = "The name of the environment"
  default = "DEV"
}


variable "instance_type" {
  description = "Specify the cluster instance type"
  default = "db.t2.small"
}

variable "engine" {
  description = "The name of the environment"
}

variable "engine_version" {
  description = "The name of the environment"
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default = "02:00-03:00"
}

variable "maintenance_window" {
  description = "The name of the environment"
  default = "wed:03:00-wed:04:00"
}

variable "environment_name" {
  description = "The name of the environment"
}

variable "vpc_name" {
  description = "The name of the VPC that the RDS cluster will be created in"
}
