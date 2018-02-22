#############################
# RDS CLUSTER PROVISIONING
#############################

module "rds_cluster" {
  source = "./modules/aurora/rds_cluster"

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

}

###############################
# RDS DB INSTANCE PROVISIONING
###############################

module "aurora_cluster_instance" {
  source = "./modules/aurora/aurora_cluster_instance"

  count                        = "${var.cluster_size}"
  identifier                   = "${var.environment_name}_aurora_instance_${count.index}"
  cluster_identifier           = "${aws_rds_cluster.aurora_cluster.id}"
  instance_class               = "${var.instance_type}"
  db_subnet_group_name         = "${aws_db_subnet_group.aurora_subnet_group.name}"
  publicly_accessible          = false
  engine                       = "${var.engine}"
  engine_version               = "${var.engine_version}"
  preferred_backup_window      = "${var.backup_window}"
  preferred_maintenance_window = "${var.maintenance_window}"

  tags {
    Name        = "${var.environment_name}-Aurora-DB-Subnet-Group"
    VPC         = "${var.vpc_name}"
    ManagedBy   = "terraform"
    Environment = "${var.environment_name}"
  }
  
}