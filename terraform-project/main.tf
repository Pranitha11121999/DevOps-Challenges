resource "aws_instance" "deepseek_model" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Replace with your AMI ID
  instance_type = "t2.xlarge"  

  # Use the dynamically created key pair
  key_name = aws_key_pair.ec2_key.key_name

  security_groups = [aws_security_group.deepseek_sg.name]

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "DeepSeekModelR1"
  }
}

data "aws_vpc" "default" {
  default = true
}



output "default_vpc_id" {
  description = "Default VPC ID retrieved dynamically"
  value       = data.aws_vpc.default.id
}