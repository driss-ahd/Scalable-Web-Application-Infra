resource "aws_wafv2_web_acl" "waf" {
  name        = "app-waf"
  scope       = "REGIONAL"
  description = "WAF for ALB"
  default_action { allow {} }
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "app-waf"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "waf_assoc" {
  resource_arn = aws_lb.app.arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}
