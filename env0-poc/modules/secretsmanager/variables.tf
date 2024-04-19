variable "secrets" {
  type = map(any)
  default = {
    "secret1" = {
      "name"                    = "secret1"
      "description"             = "description of secret1"
      "recovery_window_in_days" = 0
      "tags" = {
        "container1" = "Allow"
        "container2" = "Allow"
      },
    },
  }
}
variable environment_name {}
variable ctrlplane_aws_region {}
variable ctrlplane_tf_arn {}
variable ctrlplane_session_name {}
