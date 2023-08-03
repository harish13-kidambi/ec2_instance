# resource "aws_instance" "ec2"{
#   ami           = "ami-0ded8326293d3201b" 
#   instance_type = "t2.micro"
# }

##################################################################################################

# Launch the EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0ded8326293d3201b"  # Replace with the desired AMI ID
  instance_type = "t2.medium"  # Change this to your desired instance type

  # Use the default VPC and default security group
  vpc_security_group_ids = ["default"]

  tags = {
    Name = "Example EC2 Instance"
  }
}

# Create a security group rule allowing SSH
resource "aws_security_group_rule" "ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "default"
}

# Create a security group rule allowing HTTP (port 80)
resource "aws_security_group_rule" "http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "default"
}

# Create a security group rule allowing HTTPS (port 443)
resource "aws_security_group_rule" "https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "default"
}

