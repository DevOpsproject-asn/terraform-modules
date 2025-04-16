variable "account_id" {
  description = "AWS Account ID for constructing policy ARNs"
  type        = string
}

variable "group_name" {
  description = "Name of the IAM group"
  type        = string
}

variable "users" {
  description = "List of IAM users to create and assign to group"
  type        = list(string)
}

variable "policy_type" {
  description = "Type of policy: 'cli' or 'full'"
  type        = string
}