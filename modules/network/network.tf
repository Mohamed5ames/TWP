# Create VPC
resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_ip 

 // This line enables DNS hostnames for instances within the VPC his hostname is resolvable using AWS-provided DNS servers,
 // allowing you to access instances within the VPC using their DNS names rather than just IP addresses.
 # enable_dns_hostnames = true

  tags = {
    Name = "AppVPC"
  }
}

# Creating Public Subnet
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.public_subnet_cidr_blocks

  // when an EC2 instance is launched within this subnet, AWS automatically assigns a public IP address to the instance. 
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

# Creating Private Subnet
resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.private_subnet_cidr_blocks
  // this line means that instances launched in this subnet won't receive a public IP address by default
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet"
  }
}

# Creating Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "Gateway"
  }
}

# Creating Route Table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route Table"
  }
}

# Association 
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public_subnets.id // Public Subnet
    route_table_id = aws_route_table.RT.id  // Route Table
}

#Create route53
resource "aws_route53_zone" "example_zone" {
  name = var.domain_name
}