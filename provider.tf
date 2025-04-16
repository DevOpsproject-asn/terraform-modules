# provider.tf
provider "aws" {
  region = "us-east-1"  # To select the region specified and also account ID 
}

# aws account_000000
provider "aws" {
  alias   = "account_000000"
  region  = "us-east-1"
  profile = "account000000"    # AWS profiles (account000000) are configured in ~/.aws/credentials
}

# aws account_111111
provider "aws" {
  alias   = "account_111111"
  region  = "us-east-1"
  profile = "account111111"    # AWS profiles (account111111) are configured in ~/.aws/credentials
}

