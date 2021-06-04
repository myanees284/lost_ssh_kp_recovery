

module "my_network" {
  source             = "./Modules/recover_ssh_key/"
  vpc_cidr           = "14.0.0.0/16"
  region             = "us-east-2"
  lost_ssh_volume_id = "vol-024d2585a39454444"
  # lost ssh volume AZ
  availability_zone = "us-east-2c"
}