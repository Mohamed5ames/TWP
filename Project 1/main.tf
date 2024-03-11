module "ec2" {
  source = "../modules/ec2"
  ami= var.ami
  instance_type= var.instance_type
  subnet_id = module.network.public
 
}

module "network" {
  source="../modules/network"
  private_subnet_cidr_blocks = var.private_subnet
  vpc_ip = var.VPC_IP
  public_subnet_cidr_blocks = var.public_subnet
}

module "s3" {
    source= "../modules/storage"
    bucket_name=var.bucket
}

module "db" {
    source ="../modules/DB"
    tablename = var.Tname
}

module "endpoint" {
  source ="../modules/endpoints"
  vpc_id = module.network.vpc_id
  route_table_id = module.network.route_table_id
  region = var.region
}