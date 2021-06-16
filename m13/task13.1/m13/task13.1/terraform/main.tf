terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

#variables

variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = "default"
}

variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-east-2"
}

variable "ec2_instance_type" {
  description = "The EC2 Instance type"
  type        = string
  default     = "t2.micro" # Free Tier eligible
}

variable "ssh_key_pair" {
  description = "The SSH access key"
  type = string
  default = "ansible_server.pem"
}




variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default =8080
}

variable "tcp_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 80
}


variable "ssh_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 22
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"  
}

variable "subnet_cidr" {
         default = "10.20.1.0/24"
}

variable "azs" {
  default = "us-east-2a"
}


data "aws_ami_ansible" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["ebs-ssd"]
    }

    owners = ["099720109477"] # Canonical
}

data "aws_ami_jenkins" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["ebs-ssd"]
    }

    owners = ["099720109477"] # Canonical
}

data "aws_ami_production" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["ebs-ssd"]
    }

    owners = ["099720109477"] # Canonical
}

output "ansible_image_id" {
    value = "${data.aws_ami_ansible.ubuntu.id}"
}

output "jenkins_image_id" {
    value = "${data.aws_ami_jenkins.ubuntu.id}"
}

output "production_image_id" {
    value = "${data.aws_ami_production.ubuntu.id}"
}

#network

# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

# Create a subnet to launch our instances into
resource "aws_subnet" "default" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = subnet_cidr
  availability_zone       = var.azs
  map_public_ip_on_launch = true
}


#servers

provider "aws" {
  profile = var.profile
  region  = var.region #us-east-2b
}

resource "aws_instance" "Ansible Server" {
  ami           = "${data.aws_ami_ansible.ubuntu.id}"
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  associate_public_ip_address = true
  
  tags = {
    Name = "ansible-server"
  }
  
  key_name = var.ssh_key_pair
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]

}

resource "aws_instance" "Jenkins Server" {
  ami           = "${data.aws_ami_jenkins.ubuntu.id}"
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  associate_public_ip_address = true
  
  tags = {
    Name = "jenkins-server"
  }
  
  key_name = var.ssh_key_pair
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
}

resource "aws_instance" "Production Server" {
  ami           = "${data.aws_ami_production.ubuntu.id}"
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]  
  associate_public_ip_address = true
  
  tags = {
    Name = "production-server"
  }
  
  key_name = var.ssh_key_pair
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
}

resource "aws_security_group" "allow_ssh_http" {
  name = "terraform-vieskov-sec-group"
  description ="Allow ssh inbound traffic"
  vpc_id = ""
  
  
  ingress {
    from_port = var.server_port
	to_port   = var.server_port
	protocol  = "tcp"
	cidr_block = ["0.0.0.0/0"]
  }
  
	ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.tcp_port
    to_port     = var.tcp_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}



#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
module "vpc" {
  source = "../modules/vpc"
}

module "public_subnet" {
  source = "../modules/public-subnet"

  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "../modules/route-table"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.public_subnet.public_subnet_id
}

module "ec2" {
  source = "../modules/ec2"

  vpc_id                  = module.vpc.vpc_id
  public_subnet_id        = module.public_subnet.public_subnet_id

  ec2_ssh_key_name        = var.ec2_ssh_key_name
  ec2_ssh_public_key_path = var.ec2_ssh_public_key_path
}
