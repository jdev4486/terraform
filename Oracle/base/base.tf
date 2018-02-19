# Provider Configuration
provider "aws" {
  access_key = "AKIAJIZL4PAN6HBTBZCA"
  secret_key = "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"
  region     = "us-east-1"
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
