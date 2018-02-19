# Provider Configuration
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#Resource Configuration
resource "aws_instance" "base" {
  ami           = "ami-26ebbc5c"
  instance_type = "t2.medium"
  subnet_id     = "subnet-fe8ebf9b"

  tags {
    Name = "base"
  }
}

resource "aws_eip" "base" {
  instance = "${aws_instance.base.id}"
}
