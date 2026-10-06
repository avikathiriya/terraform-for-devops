# ec2 instance banava
#key pair (login mate )

resource "aws_key_pair" "my_key" {
  key_name   = "${var.environment}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {

    Environment = var.environment
  }
}

#vpc & sg group 
resource "aws_default_vpc" "default" {

}

# security group
resource "aws_security_group" "my_sg" {
  name        = "${var.environment}-infra-app-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_default_vpc.default.id # inetrpolation syntax to get the vpc id from the default vpc resource

  #inbound rule 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  #outbound rule 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

# ec2 instance 

resource "aws_instance" "my_instance" {
  count           = var.instance_count
  depends_on      = [aws_security_group.my_sg, aws_key_pair.my_key]
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_sg.name]
  instance_type   = var.ec2_instance_type                 #variabgle interpolation syntax
  ami             = var.ec2_ami_id             #variabgle interpolation syntax
  user_data       = file("./install-nginx.sh") # shell script file path to install nginx on ec2 instance

  root_block_device {
    volume_size = var.environment == "production" ? 20 : 10
    volume_type = "gp2"
  }
  tags = {
    Name        = "${var.environment}-infra-app-instance"
    Environment = var.environment
  }
}
