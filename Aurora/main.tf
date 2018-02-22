##############
# DB instance
##############
module "rds_cluster" {
  source = "./modules/aurora/rds_cluster"

  tags = "${var.tags}"
}