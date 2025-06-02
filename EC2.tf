resource "aws_instance" "My-EC2" {
  ami           = "ami-0f9de6e2d2f067fca"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id
  key_name      = "Balu" 
    security_groups = [aws_security_group.My-SG.id]

  tags = {
    Name = "MyEC2Instance"
  }
  
}

  