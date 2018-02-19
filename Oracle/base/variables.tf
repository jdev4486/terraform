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
   default     = ["us-east-1a","us-east-1b"]
}