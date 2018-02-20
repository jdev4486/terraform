# Provider Configuration
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#Resource Configuration
resource "aws_instance" "base" {
  ami                    = "${lookup(var.ami, var.region)}"
  instance_type          = "${lookup(var.instance_type,var.environment_type)}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_ids}"]

  tags {
    Name = "${var.app_name}"
  }
}
