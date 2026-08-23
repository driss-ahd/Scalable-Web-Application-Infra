data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

resource "aws_launch_template" "app" {

  name_prefix   = "web-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Application Server" > /var/www/html/index.html
EOF
)
}