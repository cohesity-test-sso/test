provider "aws" {
  alias   = "controlplane"
#  profile = "tf-auto"
  assume_role {
    role_arn     = var.ctrlplane_tf_arn
    session_name = var.ctrlplane_session_name
  }
  region = var.ctrlplane_aws_region
}


resource "aws_secretsmanager_secret" "all_secrets" {
  for_each                       = var.secrets
  name                           = each.value["name"]
  description                    = each.value["description"]
  recovery_window_in_days        = each.value["recovery_window_in_days"]

  tags = {
    for k, v in each.value["tags"] : k => v
  }
  provider = aws.controlplane
}


output "all_secrets" {
  value = aws_secretsmanager_secret.all_secrets
}
