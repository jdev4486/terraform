########################
## CREATE RDS CLUSTER
########################

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier              = "${var.cluster_identifier}"
  availability_zones              = ["${var.availability_zones}"]
  database_name                   = "${var.db_name}"
  master_username                 = "${var.admin_user}"
  master_password                 = "${var.admin_password}"
  backup_retention_period         = "${var.retention_period}"
  preferred_backup_window         = "${var.backup_window}"
  preferred_maintenance_window    = "${var.maintenance_window}"
  final_snapshot_identifier       = "${var.cluster_identifier}"
  skip_final_snapshot             = true
  apply_immediately               = true
  snapshot_identifier             = "${var.snapshot_identifier}"
  vpc_security_group_ids          = ["${var.vpc_rds_security_group_id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.aurora_subnet_group.name}"
  db_cluster_parameter_group_name = "${var.db_cluster_parameter_group_name}"
  engine                          = "${var.engine}"
  engine_version                  = "${var.engine_version}"

  tags {
    Name        = "${var.environment_name}-Aurora-DB-Subnet-Group"
    VPC         = "${var.vpc_name}"
    ManagedBy   = "terraform"
    Environment = "${var.environment_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#########################
## CREATE DB SUBNET GROUP
#########################

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name        = "${var.environment_name}_aurora_db_subnet_group"
  description = "Allowed subnets for Aurora DB cluster instances"

  subnet_ids = [
    "${split(",", var.vpc_rds_subnet_ids)}",
  ]

  tags {
    Name        = "${var.environment_name}-Aurora-DB-Subnet-Group"
    VPC         = "${var.vpc_name}"
    ManagedBy   = "terraform"
    Environment = "${var.environment_name}"
  }
}
