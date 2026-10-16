resource "aws_launch_template" "app" {
  name_prefix   = "app-template"
  image_id      = "ami-xxxxxxxx" # Replace with your AMI
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "app" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}

# Attach ASG to Target Group
resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.app.name
  alb_target_group_arn   = aws_lb_target_group.app_tg.arn
}
