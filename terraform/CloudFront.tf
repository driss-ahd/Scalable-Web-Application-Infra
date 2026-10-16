resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_lb.app.dns_name
    origin_id   = "alb-origin"
  }
  enabled             = true
  default_cache_behavior {
    target_origin_id       = "alb-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }
  restrictions { geo_restriction { restriction_type = "none" } }
  viewer_certificate { cloudfront_default_certificate = true }
}
