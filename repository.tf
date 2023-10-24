
locals {
  default_template = {}
  # {
  #   owner = ""
  #   repository = ""
  #   include_all_branches = true
  # }
}


## CREATING REPOSITORIES
resource "github_repository" "this" {
  name                 = var.name
  description          = try(var.description,"A Github Repository created by Terraform")
  homepage_url         = var.homepage_url

  visibility           = var.visibility
  is_template          = var.is_template

  has_issues           = var.has_issues
  has_discussions      = var.has_discussions
  has_projects         = var.has_projects
  has_wiki             = var.has_wiki
#   has_downloads        = // depricated function

  allow_merge_commit   = var.allow_merge_commit
  allow_squash_merge   = var.allow_squash_merge
  allow_rebase_merge   = var.allow_rebase_merge
  allow_auto_merge     = var.allow_auto_merge

  squash_merge_commit_title   = var.squash_merge_commit_title
  squash_merge_commit_message = var.squash_merge_commit_message

  merge_commit_title     = var.merge_commit_title
  merge_commit_message   = var.merge_commit_message
  delete_branch_on_merge = var.delete_branch_on_merge
  allow_update_branch    = var.allow_update_branch

  auto_init = var.auto_init

  archive_on_destroy   = var.archive_on_destroy
  gitignore_template   = var.gitignore_template
  license_template     = var.license_template
  topics               = var.topics
  
  vulnerability_alerts = var.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read

  dynamic "template" {
    for_each =  var.template == null ? [] : [var.template]
    content {
      owner = template.value.owner
      repository = template.value.repository
      include_all_branches = template.value.include_all_branches
    }
  }

  dynamic "pages" {
    for_each = var.pages == null ? [] : [var.pages]
    content {
      source {
        branch = pages.value.branch
        path   = pages.value.path
      }
      cname  = pages.value.cname
    }
  }

  dynamic "security_and_analysis" {
    for_each = var.security_and_analysis == null ? [] : [var.security_and_analysis]
    content {
      advanced_security {
          status = security_and_analysis.value.advanced_security
      }
      secret_scanning {
          status = security_and_analysis.value.secret_scanning
      }
      secret_scanning_push_protection {
          status = security_and_analysis.value.secret_scanning_push_protection
      }
    }
  }
}