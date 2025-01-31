output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.deepseek_model.public_ip
}

output "load_balancer_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.deepseek_lb.dns_name
}
