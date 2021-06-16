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

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default =8080
}

#servers

provider "aws" {
  profile = "default"
  region  = "us-east-2" #us-east-2b
}

resource "aws_instance" "Ansible Server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  
  tags = {
    Name = "ansible-server"
  }

}

resource "aws_instance" "Jenkins Server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  
  tags = {
    Name = "ansible-server"
  }
}

resource "aws_instance" "Production Server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]  
  
  tags = {
    Name = "ansible-server"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-vieskov-instance"
  
  ingress {
    from_port = var.server_port
	to_port   = var.server_port
	protocol  = "tcp"
	cidr_block = ["0.0.0.0/0"]
  }
}

