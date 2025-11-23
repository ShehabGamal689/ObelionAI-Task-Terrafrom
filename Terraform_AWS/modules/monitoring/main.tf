resource "aws_sns_topic" "cpu_alerts" {
  name = "cpu-alerts-topic"
}

resource "aws_sns_topic_subscription" "cpu_email" {
  topic_arn = aws_sns_topic.cpu_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "frontend_cpu_high" {
  alarm_name          = "frontend-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Frontend CPU > 50% for 10 minutes"
  alarm_actions       = [aws_sns_topic.cpu_alerts.arn]

  dimensions = {
    InstanceId = var.frontend_instance_id
  }
}

resource "aws_cloudwatch_metric_alarm" "backend_cpu_high" {
  alarm_name          = "backend-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Backend CPU > 50% for 10 minutes"
  alarm_actions       = [aws_sns_topic.cpu_alerts.arn]

  dimensions = {
    InstanceId = var.backend_instance_id
  }
}
