# AWS Solution With Terraform
# Description
This repository hosts Terraform configuration files for deploying AWS infrastructure across various regions. The project is structured into modules to handle distinct resources, with separate directories for individual projects deployed across different AWS regions,
Within this Terraform project, infrastructure is provisioned in two AWS regions: Project 1 and Project 2. It encompasses modules for deploying EC2 instances, DynamoDB tables, S3 buckets, VPCs, and subnets. The latest commit introduces VPC endpoints to improve security and connectivity.

# Modules
 ## Network Module:
This module handles the configuration of the VPC, subnets, and security groups.

### Input parameters:

- vpc_ip: The CIDR block assigned to the VPC.
- public_subnet_cidr_blocks: The CIDR block designated for the public subnet.
- private_subnet_cidr_blocks: The CIDR block allocated for the private subnet.


## EC2 Module:
This module orchestrates the deployment of an EC2 instance.

### Input parameters:

- ami: The AMI ID used for the EC2 instance.
- instance_type: The instance type assigned to the EC2 instance.
- subnet_id: The ID of the public subnet where the EC2 instance is deployed.


## S3 Module:
This module is responsible for creating an S3 bucket.

### Input parameters:

- bucket_name: The name assigned to the S3 bucket.

## DynamoDB Module:
This module manages the setup of a DynamoDB table.

### Input parameters:

- tablename: The name assigned to the DynamoDB table.
