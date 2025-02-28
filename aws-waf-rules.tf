resource "aws_wafv2_web_acl" "security_acl" {
  name        = "malicious-request-blocker"
  scope       = "REGIONAL"
  description = "Blocks SQLi and bad bots"

  default_action {
    allow {}
  }

  rule {
    name     = "BlockSQLi"
    priority = 1

    action {
      block {}
    }

    statement {
      sqli_match_statement {
        field_to_match {
          body {}
        }
        text_transformation {
          priority = 1
          type     = "URL_DECODE"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "BlockSQLi"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "security-acl"
    sampled_requests_enabled   = true
  }
}
