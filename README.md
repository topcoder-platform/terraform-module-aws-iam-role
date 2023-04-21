# Terraform AWS IAM Role Module

This Terraform module creates an AWS IAM role for generic use cases, in this example - allowing ECS tasks to assume a role with dynamic permission, and attaches it to the IAM role.

## Usage

To use this module in your Terraform project, add the following to your `main.tf` file:

```hcl
module "ecs_iam_role" {
  source = "git::git@github.com:topcoder-platform/terraform-module-aws-iam-role.git"

  resources = [
    "arn:aws:s3:::my-bucket/*",
    "arn:aws:sqs:us-east-1:123456789012:my-queue"
  ]

  permissions = [
    "s3:ListBucket",
    "s3:GetObject",
    "s3:PutObject",
    "sqs:SendMessage",
    "sqs:ReceiveMessage",
    "sqs:DeleteMessage"
  ]

  service_principal = "ecs-tasks.amazonaws.com"
}
```

### Input Variables

| Name               | Description                                                   | Type           | Default                | Required |
|--------------------|---------------------------------------------------------------|----------------|------------------------|----------|
| resources          | List of resource ARNs the policy should apply to              | list(string)   | ["*"]                  | No       |
| permissions        | List of permissions to be allowed for the specified resources | list(string)   | ["s3:*", "sqs:*"]      | No       |
| service_principal  | The service principal to be allowed to assume the role        | string         | "ecs-tasks.amazonaws.com" | No    |
| role_name          | The unique name for the IAM role                              | string         | "ecs-task-execution-role" | No     |
| policy_name        | The unique name for the IAM policy                            | string         | "dynamic-policy"          | No     |

### Output Variables

| Name                     | Description                         |
|--------------------------|-------------------------------------|
| iam_role_arn | ARN of the IAM Role |
| dynamic_policy_arn        | ARN of the Dynamic IAM Policy       |
| dynamic_policy_attachment_id | ID of the IAM Role Policy Attachment |

