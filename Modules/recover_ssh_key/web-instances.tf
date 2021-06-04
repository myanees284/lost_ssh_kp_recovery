#Launch Recovery EC2
resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.web_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  // vpc_security_group_ids      = "sg-0c84f1f30e3e095fd"
  // user_data                   = file("${path.module}/recovery.sh")
  user_data = data.template_file.init.rendered
  key_name   = "linuxserver"
  tags = {
    Name = "${terraform.workspace}_recovery_instance"
  }
}


resource "aws_volume_attachment" "ebc_volume_attachment" {
  device_name = var.device_name
  volume_id   = var.lost_ssh_volume_id
  instance_id = aws_instance.web.id
}

data "template_file" "init" {
  template = "${file("${path.module}/recovery.sh")}"

  vars = {
    device_name = var.device_name
  }
}