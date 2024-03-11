#S3 VARIABLES
variable "bucket" {
    description = "to define s3 instance"
    type= string
}

#EC2 VARIABLES
variable "ami" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    type= string 
}


#NETWORK VARIABLES
variable "VPC_IP" {
  description = "VPC CIDR Block"
  type = string
}

variable "public_subnet" {
  description = "Public Subnet"
  type = string
}

variable "private_subnet" {
  description = "Private Subnet"
  type = string
}


variable "region" {
    description= "to define the region "
    type= string 
}

#dynamoVariables
variable "Tname" {
  description = "value"
  type = string
}