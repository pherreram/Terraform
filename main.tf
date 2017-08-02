provider "aws"{
	region="us-west-1"
}

resource "aws_instance" "terraform"{
	ami="ami-327f5352"
	instance_type="t2.micro"
	tags{
		Name="Terraform-Lab"
	}
}
