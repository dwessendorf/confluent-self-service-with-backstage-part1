terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">= 0.2.0"  # Adjust this version constraint as needed.
    }
  }
}

variable "env_name" {
  description = "The name of the Confluent Cloud Environment."
  type        = string
}

resource "confluent_environment" "this" {
  display_name = var.env_name
}

output "environment_id" {
  value = confluent_environment.this.id
}
