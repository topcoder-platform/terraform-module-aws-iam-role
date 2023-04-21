resource "aws_iam_role" "dynamic_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = var.service_principal
        }
      }
    ]
  })
}

resource "aws_iam_policy" "dynamic_policy" {
  name        = var.policy_name
  description = "Policy with dynamic resources and permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = var.permissions
        Effect = "Allow"
        Resource = var.resources
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dynamic_policy_attachment" {
  policy_arn = aws_iam_policy.dynamic_policy.arn
  role       = aws_iam_role.dynamic_role.name
}
