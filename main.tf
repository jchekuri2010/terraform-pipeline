# Create VPC
resource "aws_vpc" "intuitive_vpc" {
  cidr_block = var.vpc_cidr_block
  
  tags = {
    Name = "intuitive_vpc"
  }
}

# provider "aws" {
 # region = var.aws_region
#}
  
resource "aws_s3_bucket" "hosting_bucket"{
  bucket = var.bucket_name
  acl    = "private"
  
}

# Create subnet
resource "aws_subnet" "intuitive_subnet" {
  vpc_id     = aws_vpc.intuitive_vpc.id
  cidr_block = var.subnet_cidr_block
  
  tags = {
    Name = "intuitive_subnet"
  }
}

# Create EC2 instances
resource "aws_instance" "intuitive_ec2_instance" {
  count         = var.instance_count
  instance_type = var.instance_type
  subnet_id     = aws_subnet.intuitive_subnet.id
    ami            = "ami-0715c1897453cabd1"      
  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = "gp2"
  }
  tags = {
    Name = "intuitive_ec2_instance"
  }
}
