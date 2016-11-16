resource "aws_instance" "nginx" {
  ami                    = "${data.aws_ami.nginx.id}"
  instance_type          = "t2.nano"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.nginx.id}"]
  key_name               = "terraform"

  tags = {
    Name = "meetup-devops-nginx"
  }
}

resource "aws_security_group" "nginx" {
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "meetup-devops-nginx"
  }
}

data "aws_ami" "nginx" {
  most_recent = true

  filter {
    name   = "name"
    values = ["meetup-devops-nginx-*"]
  }
}

output "public_dns" {
  value = "${aws_instance.nginx.public_dns}"
}

variable "subnet_id" {}

variable "vpc_id" {}
