module "ec2_instances" {
  source = "./ec2_multi-instance"  

  instances = [
    {
      instance_type = "t2.micro"
      volume_type   = "gp2"
      volume_size   = 8
      key_name      = "key1"
    },
    {
      instance_type = "m5.large"
      volume_type   = "io1"
      volume_size   = 10
      key_name      = "key2"
    },
    {
      instance_type = "t3.medium"
      volume_type   = "gp2"
      volume_size   = 20
      key_name      = "key3"
    },
    {
      instance_type = "c5.large"
      volume_type   = "gp2"
      volume_size   = 30
      key_name      = "key4"
    },
    {
      instance_type = "c5.xlarge"
      volume_type   = "gp3"
      volume_size   = 50
      key_name      = "key5"
    }
  ]
}


module "account_0000000_cli_access_iam" {
  source    = "./modules/iam_users_group"
  providers = {
    aws = aws.account_0000000
  }

  account_id  = "000000000000"
  group_name  = "group1"
  users       = ["engine", "ci"]
  policy_type = "cli"
}

module "account_0000000_full_access_iam" {
  source    = "./modules/iam_users_group"
  providers = {
    aws = aws.account_0000000
  }

  account_id  = "000000000000"
  group_name  = "group2"
  users       = ["john_doe", "aboubacar_maina"]
  policy_type = "full"
}


module "roleA_admin" {
  source     = "./modules/iam_role"
  providers  = { aws = aws.account_000000 }

  role_name         = "roleA"
  assume_role_arn   = "*" # Universal assume role or limited to IAM Users
  policy_statements = [
    {
      Effect = "Allow"
      Action = ["*"]
      Resource = ["*"]
    },
    {
      Effect = "Deny"
      Action = ["iam:*"]
      Resource = ["*"]
    }
  ]
}

module "roleB_to_assume_roleC" {
  source     = "./modules/iam_role"
  providers  = { aws = aws.account_000000 }

  role_name       = "roleB"
  assume_role_arn = "*"
  policy_statements = [
    {
      Effect = "Allow"
      Action = ["sts:AssumeRole"]
      Resource = ["arn:aws:iam::111111111111:role/roleC"]
    }
  ]
}

module "roleC_target" {
  source     = "./modules/iam_role"
  providers  = { aws = aws.account_111111 }

  role_name       = "roleC"
  assume_role_arn = "arn:aws:iam::000000000000:role/roleB"
  policy_statements = [
    {
      Effect = "Allow"
      Action = ["s3:*"]
      Resource = [
        "arn:aws:s3:::aws-test-bucket",
        "arn:aws:s3:::aws-test-bucket/*"
      ]
    }
  ]
}