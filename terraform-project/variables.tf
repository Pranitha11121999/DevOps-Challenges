variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-xyz"  # Replace with your GPU-enabled AMI
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "g4dn.xlarge"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "my-key"  # Replace with your key pair name
}

variable "vpc_id" {
  description = "VPC ID where the resources will be deployed"
  default     = "vpc-0e3ac6c0dfe1cbe75"  # Use your real VPC ID
}


variable "subnets" {
  description = "List of subnets for the load balancer"
  type        = list(string)
  default     = ["subnet-0a6a9645900fb9fe8", "subnet-03bd4aae7b7dcc1a2"]  # Replace with real subnets
}

