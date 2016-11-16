resource "aws_instance" "band_gen" {
  ami                    = "${data.aws_ami.band_gen.id}"
  instance_type          = "t2.nano"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.band_gen.id}"]
  key_name               = "terraform"

  tags = {
    Name = "meetup-devops-band-gen"
  }
}

resource "aws_security_group" "band_gen" {
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "meetup-devops-band-gen"
  }
}

data "aws_ami" "band_gen" {
  most_recent = true

  filter {
    name   = "name"
    values = ["meetup-devops-band-gen-*"]
  }
}

output "public_dns" {
  value = "${aws_instance.band_gen.public_dns}"
}

variable "subnet_id" {}

variable "vpc_id" {}
