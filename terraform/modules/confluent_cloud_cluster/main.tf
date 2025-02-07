terraform {
  required_providers {
    confluentcloud = {
      source  = "confluentinc/confluentcloud"
      version = "~> 1.0"
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

resource "confluentcloud_kafka_cluster" "this" {
  display_name   = var.cluster_name
  environment_id = var.environment_id
  cloud          = "GCP"        # For this example, we use GCP
  region         = "us-central1" # Adjust as needed
  availability   = "SINGLE_ZONE"
  capacity       = 2             # Example value, adjust as needed
}
