terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">= 0.2.0"  # Adjust this version constraint as needed.
    }
  }
}
provider "confluent" {
  # Use your Confluent Cloud credentials (set these via environment variables)
  # For example, export CONFLUENT_CLOUD_API_KEY and CONFLUENT_CLOUD_API_SECRET
}

variable "environment_name" {
  type    = string
  default = "dev-environment"
}

variable "cluster_name" {
  type    = string
  default = "dev-cluster"
}

module "confluent_env" {
  source   = "../../modules/confluent_cloud_environment"
  env_name = var.environment_name
}

module "confluent_cluster" {
  source         = "../../modules/confluent_cloud_cluster"
  cluster_name   = var.cluster_name
  environment_id = module.confluent_env.this.id
}
