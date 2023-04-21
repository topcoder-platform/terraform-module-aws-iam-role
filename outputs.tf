output "iam_role_arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "dynamic_policy_arn" {
  description = "ARN of the Dynamic IAM Policy"
  value       = aws_iam_policy.dynamic_policy.arn
}

output "dynamic_policy_attachment_id" {
  description = "ID of the IAM Role Policy Attachment"
  value       = aws_iam_role_policy_attachment.dynamic_policy_attachment.id
}
