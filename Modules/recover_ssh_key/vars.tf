# Declaring the region
variable "region" {
  default = "us-east-2"
  type    = string
}

# Declaring the VPC cidr
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

# Declaring the VPC cidr
variable "availability_zone" {
  default = "us-east-2a"
  type    = string
}

# Recovery AMI id
variable "ami" {
  default = "ami-077e31c4939f6a2f3"
  type    = string
}

# Recovery instance type
variable "web_type" {
  default = "t2.micro"
  type    = string
}

# lost ec2 instance volume
variable "lost_ssh_volume_id" {
  default = "dummy"
  type    = string
}

# Device name
variable "device_name" {
  default = "/dev/sdf"
  type    = string
}
