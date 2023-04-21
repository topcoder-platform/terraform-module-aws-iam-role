variable "resources" {
  description = "List of resource ARNs the policy should apply to"
  type        = list(string)
  default     = ["*"]
}

variable "permissions" {
  description = "List of permissions to be allowed for the specified resources"
  type        = list(string)
  default     = ["s3:*", "sqs:*"]
}

variable "service_principal" {
  description = "The service principal to be allowed to assume the role"
  default     = "ecs-tasks.amazonaws.com"
}

variable "role_name" {
  description = "The unique name for the IAM role"
  default     = "ecs-task-execution-role"
}

variable "policy_name" {
  description = "The unique name for the IAM policy"
  default     = "dynamic-policy"
}
