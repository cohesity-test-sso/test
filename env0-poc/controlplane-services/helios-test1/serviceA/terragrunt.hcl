nclude {
  path = find_in_parent_folders()
}
terraform {
  #source = "git@github.com:cohesity/terraform_modules.git//secretsmanager?ref=v1.0.1"
  #source = "../../../modules/secretsmanager"
  source = "git@github.com:cohesity/terraform_modules.git//secretsmanager?ref=v6.0.2"
}
inputs = {
  ctrlplane_tf_arn       = "arn:aws:iam::605698800693:role/tf-auto"
  ctrlplane_session_name = "env0-poc"
  environment_name       = "devenv"
  ctrlplane_aws_region   = "us-east-2"
  secrets = {
    "helios-devenv/self-service-demo-1" = {
      "name"                    = "helios-devenv/self-service-demo-1"
      "description"             = "demo-1"
      "recovery_window_in_days" = 0
      "tags" = {
        purpose = "demo-1"
      },
    },
  }
}
