/* Aws Provider Code for Aurora Provisioning */

########################
## Cluster
########################

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
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
    Name        = "${var.environment_name}-Aurora-DB-Instance-${count.index}"
    VPC         = "${var.vpc_name}"
    ManagedBy   = "terraform"
    Environment = "${var.environment_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
