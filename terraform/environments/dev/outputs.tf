output "environment_id" {
  value = module.confluent_env.this.id
}

output "cluster_id" {
  value = module.confluent_cluster.this.id
}
