variable "access_key" {
  type        = "string"
  description = "AWS access key"
}

variable "secret_key" {
  type        = "string"
  description = "AWS Secret Key"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
  default     = "us-east-1"
}

variable "region_list" {
  type        = "list"
  description = "AWS Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ami" {
  type = "map"

  default = {
    us-east-1 = "ami-26ebbc5c"
    us-west-1 = "ami-223f945a"
  }

  description = "AWS AMI"
}

variable "subnet_id" {
  type        = "string"
  default     = "subnet-fe8ebf9b"
  description = "AWS Subnet ID"
}

variable "instance_type" {
  type = "map"

  default = {
    prod    = "t2.large"
    preprod = "t2.medium"
    dev     = "t2.small"
  }

  description = "AWS Subnet ID"
}

variable "environment_type" {
  type        = "string"
  default     = "dev"
  description = "Environment Details"
}

variable "app_name" {
  type        = "string"
  default     = "ANU"
  description = "Application this instance belongs to"
}

variable "security_group_ids" {
  type    = "list"
  default = ["sg-2b183650", "sg-4066533b", "sg-6eac9b15"]
}
