terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">= 0.2.0"  # Adjust this version constraint as needed.
    }
  }
}
variable "cluster_name" {
  description = "The name of the Confluent Cloud Kafka Cluster."
  type        = string
}

variable "environment_id" {
  description = "The ID of the Confluent Cloud Environment."
  type        = string
}

resource "confluent_kafka_cluster" "this" {
  display_name   = var.cluster_name
  environment {
    id = var.environment_id
  }
  cloud          = "GCP"        # For this example, we use GCP
  region         = "europe-west3" # Adjust as needed
  availability   = "SINGLE_ZONE"
  basic {}          # Example value, adjust as needed
}

output "cluster_id" {
  value = confluent_kafka_cluster.this.id
}
