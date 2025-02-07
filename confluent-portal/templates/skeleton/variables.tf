variable "environment_name" {
  type    = string
  default = "${{ environment_name }}"
}

variable "cluster_name" {
  type    = string
  default = "${{ cluster_name }}"
}
