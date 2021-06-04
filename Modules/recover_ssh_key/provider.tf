#provider tells terraform which cloud provider to use
provider "aws" {
  region = var.region
}