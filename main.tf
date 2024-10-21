data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["211125348329"] # Bitnami
}

data "aws_vpc" "default"{
  default =true
}

resource "aws_instance" "blog" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

vpc_security_group_ids = [aws_security_group.blog.id]

  tags = {
<<<<<<< HEAD
    Name = "Security Groups on AWS"
=======
    Name = "Deepak's World"
>>>>>>> 0da4d6b61cc690bd016eedc10f2b442805934f36
  }
}

resource "aws_security_group" "blog" {
  name        = "blog" 
  description = "Allow http and in. Allow everything out"

  vp_id = data.aws_vpc.default.id
}

resource = "aws_security_group "blog_https_in" {

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protoco     = 'tcp'
  cidr_blocks = ["0.0.0.0/0"]

  aws_security_group_id = aws_security_group.blog.id
}

resource = "aws_security_group "blog_everything_out" {

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protoco     = 0
  cidr_blocks = ["0.0.0.0/0"]

  aws_security_group_id = aws_security_group.blog.id
}

resource = "aws_security_group "blog_http_in" {

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protoco     = 'tcp'
  cidr_blocks = ["0.0.0.0/0"]

  aws_security_group_id = aws_security_group.blog.id
}
