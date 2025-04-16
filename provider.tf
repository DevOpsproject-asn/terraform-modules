# provider.tf
provider "aws" {
  region = "us-east-1"  # To select the region specified and also account ID 
}

# aws account_0000000
provider "aws" {
  alias   = "account_0000000"
  region  = "us-east-1"
  profile = "account0000000"    # AWS profiles (account0000000) are configured in ~/.aws/credentials
}

# aws account_1111111
provider "aws" {
  alias   = "account_1111111"
  region  = "us-east-1"
  profile = "account1111111"    # AWS profiles (account1111111) are configured in ~/.aws/credentials
}

