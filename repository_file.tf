locals {
  template_files = fileset(path.module, "resources/template_files/*.tftpl")

  variables = {
    repository  = github_repository.this.name, 
    description = github_repository.this.description,
    team        = "empty",
    owner       = var.owner,
    codeowners  = join(", ", var.codeowners),
    http_url    = github_repository.this.html_url,
  }

  templates = [
    {
      file_name           = "README.md"
      file_location       = "/resources/template_files/readme.tftpl"
      variables           = local.variables
      commit_message      = "docs: initial readme.md update"
      commit_author       = "Terraform"
      commit_email        = "example@example.com"
      overwrite_on_create = true
    },
    {
      file_name           = "CODEOWNERS"
      file_location       = "/resources/template_files/codeowners.tftpl"
      variables           = local.variables
      commit_message      = "docs: initial CODEOWNERS update"
      commit_author       = "Terraform"
      commit_email        = "example@example.com"
      overwrite_on_create = true
    }
  ]
}

resource "github_repository_file" "files" {
  for_each = { for index, files in local.templates: files.file_name => files}
  repository          = github_repository.this.name
  branch              = var.default_branch != null ? github_branch_default.default.0.branch : "main"
  file                = each.value.file_name
  content             = templatefile("${path.module}${each.value.file_location}", each.value.variables)
  commit_message      = each.value.commit_message
  commit_author       = each.value.commit_author
  commit_email        = each.value.commit_email
  overwrite_on_create = each.value.overwrite_on_create

  depends_on = [
    github_actions_secret.personal_token
  ]
}