# Provider Configuration
provider "aws" {

  region = "us-east-1"
  
}

#Resource Configuration
resource "aws_instance" "hello-instance" {
  ami = "ami-26ebbc5c"
  instance_type = "t2.micro"
  tags {
    Name = "hello-instance"
  }
}