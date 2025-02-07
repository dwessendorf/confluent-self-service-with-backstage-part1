terraform {
  required_providers {
    confluentcloud = {
      source  = "confluentinc/confluentcloud"
      version = "~> 1.0"
    }
  }
}

variable "env_name" {
  description = "The name of the Confluent Cloud Environment."
  type        = string
}

resource "confluentcloud_environment" "this" {
  display_name = var.env_name
}
