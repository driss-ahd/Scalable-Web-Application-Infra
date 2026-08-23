resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.infrastructure_alerts.arn
  protocol  = "email"
  endpoint  = "drissahd@gmail.com"
}