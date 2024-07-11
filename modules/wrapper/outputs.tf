

output "wrapper" {
  description = "Map of outputs of a wrapper."
  value       = module.wrapper
}

output "github_repository_list" {
    description = "List of repositories created from the wrapper."
    value = keys(var.items)
}

output "github_repository_list_enabled" {
    description = "List of trust enabled repositories created from the wrapper."
    value =  [for k, v in var.items : k if try(v.enable_aws_trust, var.defaults.enable_aws_trust)]
}
