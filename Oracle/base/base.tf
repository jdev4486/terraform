# Provider Configuration
provider "aws" {
  access_key = "AKIAJB4VNIYT7TAQAJVQ"
  secret_key = "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"
  region     = "us-east-1"
}

#Resource Configuration
resource "aws_instance" "base" {
  ami           = "ami-26ebbc5c"
  instance_type = "t2.micro"
  subnet_id     = "subnet-fe8ebf9b"

  tags {
    Name = "base"
  }
}

resource "aws_eip" "base" {
  instance = "${aws_instance.base.id}"
}
