resource "aws_route53_record" "app" {
  zone_id = "ZXXXXXXXX" # Replace with your hosted zone
  name    = "app.example.com"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
