# Generate an RSA private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS Key Pair using the generated public key
resource "aws_key_pair" "ec2_key" {
  key_name   = "deepseek-key-pair"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the private key locally to a file (Fully Automated)
resource "local_file" "private_key" {
  filename        = "deepseek-key.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0600" # Set secure permissions
}

# Output the key name (for debugging)
output "key_pair_name" {
  description = "The name of the created AWS key pair"
  value       = aws_key_pair.ec2_key.key_name
}
