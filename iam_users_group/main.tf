resource "aws_iam_group" "access_group" {
  name = var.group_name
}

resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.value
}

resource "aws_iam_user_group_membership" "group_membership" {
  for_each = toset(var.users)
  user     = aws_iam_user.users[each.value].name
  groups   = [aws_iam_group.access_group.name]
}

resource "aws_iam_group_policy" "cli_policy" {
  count = var.policy_type == "cli" ? 1 : 0
  name  = "CLI-Only-Policy"
  group = aws_iam_group.access_group.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sts:GetCallerIdentity",
          "iam:GetUser"
        ],
        Resource = "arn:aws:iam::${var.account_id}:user/*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "admin_access" {
  count      = var.policy_type == "full" ? 1 : 0
  group      = aws_iam_group.access_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}