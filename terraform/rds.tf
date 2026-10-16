resource "aws_db_subnet_group" "app" {
  name       = "app-db-subnet-group"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

resource "aws_db_instance" "app_db" {
  identifier           = "app-db"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "changeme123!"
  db_subnet_group_name = aws_db_subnet_group.app.name
  multi_az             = true
  skip_final_snapshot  = true
}
