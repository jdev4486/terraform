# Provider Configuration
provider "aws" {
  access_key = "AKIAJ6AE7ZSSOCM5V5ZA"
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
