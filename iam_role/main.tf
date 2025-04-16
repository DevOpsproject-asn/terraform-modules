resource "aws_iam_role" "custom_named_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = var.assume_role_arn
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "custom_named_policy" {
  name = "${var.role_name}-inline-policy"
  role = aws_iam_role.custom_named_role.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = var.policy_statements
  })
}
