1) Create a Terraform module that provisions multiple EC2 instances with the following requirements:

 

Single Variable: Use a single variable to configure 5 EC2 instances with different instance types, volume types, volume size and key pairs.
Each instance should have:
An instance type (e.g., t2.micro, m5.large, etc.)
A volume type (e.g., gp2, io1, etc.)
A volume size (e.g., 8, 10, 20, etc.)
A key pair for SSH access (e.g., key1, key2, etc.)

 # Refer Module: ec2_multi-instance created the terraform scripts

Q2) Step 1 - create basic groups and users in the account 000000000000
- 2 groups:
- group1 - should contain users with cli access only
  Users:
    - engine
    - ci
- group2 - must contain full users
  Users:
   - John Doe
   - Aboubacar Maina
- each group must have appropriate policies

 # Refer Module: iam_users_group  terraform scripts 

Step 2 - create roles in the account 000000000000
  - roleA - administrative role with a policy that allows access to all AWS services except
IAM
  - roleB - a service role with a policy that allows you to assume the roleC role in the AWS
account 1111111111

# Refer Module: iam_role  terraform scripts

Step 3 - create a role in the 1111111111 account and allow assume from another account
- roleC is a service role that allows full access to the s3 bucket aws-test-bucket
  this role can be called by roleB from the 000000000000 account

 # Refer Module: iam_role  terraform scripts


# terraform-modules 
Step 1: Initialize the Terraform working directory:

terraform init

#Step 2: Review the execution plan:

terraform plan

#Step 3: Apply the changes to  AWS accounts:

terraform apply 
