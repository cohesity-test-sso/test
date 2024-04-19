locals {
  workspace = "devenv"
}
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "env0-poc-bucket"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    acl            = "bucket-owner-full-control"
    dynamodb_table = "test-lock-table"
#    # profile        = "tf-auto"
#    # This role is configured to allow atlantis to access dynamodb lock table in landing account
   # role_arn       = "arn:aws:iam::127319306216:role/tf-auto"
  }
}
