locals {
  template_files = fileset(path.module, "resources/template_files/*.tftpl")

  templates = [
    {
      file_name     = "package.json"
      file_location = "/resources/template_files/package_json.tftpl"
      variables     = {
          repository = github_repository.this.name, 
          http_url   = github_repository.this.html_url,
      }
      commit_message      = "docs: initial package.json update"
      commit_author       = "Terraform"
      commit_email        = "example@mail.com"
      overwrite_on_create = true
    },
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