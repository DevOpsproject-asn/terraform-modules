variable "role_name" {
  type = string
}

variable "assume_role_arn" {
  type = string
}

variable "policy_statements" {
  type = list(object({
    Effect   = string
    Action   = list(string)
    Resource = list(string)
  }))
}