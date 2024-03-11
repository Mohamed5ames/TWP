variable "ami" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    type= string 
}

variable "subnet_id" {
  description = "choose the subnet to attach the instance to"
  type = string
}
