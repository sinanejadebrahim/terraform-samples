resource "aws_instance" "my-server" {
  ami           = var.os_ami
  instance_type = var.size
  tags = {
    Name = var.name
  }
  # you can run any command using userdata
  user_data = <<EOF
            #!/bin/bash
            apt update
            EOF

  key_name               = aws_key_pair.key.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}
# Add my public key to the server
resource "aws_key_pair" "key" {
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "allow ssh from 0.0.0.0/0"
  ingress {
    protocol    = "tcp"
    from_port   = "22"
    to_port     = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# show public ip after terraform apply
output "public_ip" {
  value = aws_instance.my-server.public_ip
}
