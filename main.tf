# Create VPC
resource "aws_vpc" "intuitive_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Create subnet
resource "aws_subnet" "intuitive_subnet" {
  vpc_id     = aws_vpc.intuitive_vpc.id
  cidr_block = var.subnet_cidr_block
}

# Create EC2 instances
resource "aws_instance" "intuitive_ec2_instance" {
  count         = var.instance_count
  instance_type = var.instance_type
  subnet_id     = aws_subnet.intuitive_subnet.id

  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = "gp2"
  }
}
