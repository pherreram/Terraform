provider "aws"{
	region="us-west-1"
}

resource "aws_instance" "terraform"{
	ami="ami-09d2fb69"
	instance_type="t2.micro"
	vpc_security_group_ids=["${aws_security_group.webserver.id}"]
	user_data=<<-EOF
			#!/bin/bash
			echo "Hello world" > index.html
			nohub busybox httpd -f -p 8080 &
		EOF
	tags{
		Name="Terraform-Lab"
	}
}

resource "aws_security_group" "webserver"{

	name="Terraform-Web-Server"

	ingress{
		from_port=8080
		to_port=8080
		protocol="tcp"
		cidr_blocks=["0.0.0.0/0"]
	}

}
