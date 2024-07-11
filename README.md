<br />
<div id="readme-top" align="center">
  <a href="https://github.com/mBlomsterberg/">
    <picture>
      <source srcset="logo_inv.png" media="(prefers-color-scheme: dark)">
      <img src="logo.png" width="200" height="200">
    </picture>
  </a>

  <h3 align="center">terraform-github-repository-module</h3>

  <p align="center">
    Terraform Module for GitHub Repository creation.
    <br />
    <br />
    <a href="https://github.com/mBlomsterberg/terraform-github-repository-module/blob/main/examples/">Module Examples</a>
    ·
    <a href="https://github.com/mBlomsterberg/terraform-github-repository-module/blob/main/documentation/version.md">Versioning</a>
  </p>
  <br />
</div>

<div align="center">
<img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white"> <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"> 
</div>

<br>

# About


# Contact 
**Github** [mBlomsterberg](https://github.com/mBlomsterberg) 

**Linkedin** [Mikkel Blomsterberg](https://www.linkedin.com/in/mikkel-blomsterberg-663b785a/)


# Setup

## Versioning

We use [Semantic Versioning](http://semver.org/) for versioning.

# Contribution guidelines
Should your repository be open to an external or onboarding new members you can create guidelines to communicate how people should contribute to your project. [Example](https://github.com/github/docs/blob/main/CONTRIBUTING.md)

# Code of Conduct

This project has adopted the XXXXXX Code of Conduct. For more information see the Code of Conduct FAQ or contact [mBlomsterberg](https://github.com/mBlomsterberg) with any additional questions or comments.

# License

Licensed under the MIT license.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.25.0, < 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 5.25.0, < 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.personal_token](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_issue.example](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_autolink_reference.autolink](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference) | resource |
| [github_repository_collaborators.collaborators](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborators) | resource |
| [github_repository_environment.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |
| [github_repository_file.files](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_team.team_ids](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_user.current](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |
| [github_user.user_ids](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | (Optional) Set to true to allow auto-merging pull requests on the repository. | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | (Optional) Set to false to disable merge commits on the repository. | `bool` | `true` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | (Optional) Set to false to disable rebase merges on the repository. | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | (Optional) Set to false to disable squash merges on the repository. | `bool` | `true` | no |
| <a name="input_allow_update_branch"></a> [allow\_update\_branch](#input\_allow\_update\_branch) | (Optional) Set to true to always suggest updating pull request branches. | `bool` | `false` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | (Optional) Set to true to archive the repository instead of deleting on destroy. | `bool` | `true` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | (Optional) Set to true to produce an initial commit in the repository. | `bool` | `false` | no |
| <a name="input_branch_protection"></a> [branch\_protection](#input\_branch\_protection) | (Optional) The repository's default branch protection configuration. | <pre>object({<br>        branch = optional(string, null)<br>        enforce_admins = optional(bool, true)<br>        required_status_checks = optional(object({<br>            strict = optional(bool,false)<br>            checks = optional(list(string), [])<br>        }))<br>        required_pull_request_reviews = optional(object({<br>            dismiss_stale_reviews = optional(bool,true)<br>            dismissal_users = optional(list(string),[])<br>            dismissal_teams = optional(list(string),[])<br>            require_code_owner_reviews =  optional(bool,false)<br>            required_approving_review_count = optional(number,0)<br>            bypass_pull_request_allowances = optional(object({<br>                users = optional(list(string),[""])<br>                teams = optional(list(string),[""])<br>                apps  = optional(list(string),[])<br>            }), null)<br>        }), {})<br>    })</pre> | `null` | no |
| <a name="input_codeowners"></a> [codeowners](#input\_codeowners) | (Optional) This is the target team or individual user account that manages the code in the repository. | `list(string)` | `null` | no |
| <a name="input_collaborator_teams"></a> [collaborator\_teams](#input\_collaborator\_teams) | (Optional) The list of team names that is added as collaborators to the repository. | <pre>list(object({<br>        permission = optional(string, "read")<br>        team_id = optional(string, "")<br>    }))</pre> | `[]` | no |
| <a name="input_collaborator_users"></a> [collaborator\_users](#input\_collaborator\_users) | (Optional) The list of user names that is added as collaborators to the repository. | <pre>list(object({<br>        permission = optional(string, "read")<br>        username = optional(string, "")<br>    }))</pre> | `[]` | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | (Optional) Set to true to produce an initial commit in the repository. | `string` | `null` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | (Optional) Automatically delete head branch after a pull request is merged. Defaults to false. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description of the repository. | `string` | `"Terraform created GitHub Repository"` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | (Optional) The repository's environment configurations. | <pre>list(object({<br>        environment = string<br>        wait_timer = optional(number,0)<br>        reviewers = optional(object({<br>            users = optional(list(string),[])<br>            teams = optional(list(string),[])<br>        }), null)<br>        deployment_branch_policy = optional(object({<br>            protected_branches = optional(bool, false)<br>            custom_branch_policies = optional(bool,false)<br>        }),null)<br><br>    }))</pre> | `[]` | no |
| <a name="input_github_repository_autolink_reference"></a> [github\_repository\_autolink\_reference](#input\_github\_repository\_autolink\_reference) | (Optional) This allows you to create an autolink reference. | <pre>object({<br>        key_prefix = string<br>        target_url_template = string<br>        is_alphanumeric = optional(bool, false)<br>    })</pre> | `null` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | (Optional) Use the name of the template without the extension. For example, "Haskell". | `string` | `null` | no |
| <a name="input_has_discussions"></a> [has\_discussions](#input\_has\_discussions) | (Optional) Set to true to enable GitHub Discussions on the repository. | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | (Optional) Set to true to enable the GitHub Issues features on the repository. | `bool` | `false` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | (Optional) Set to true to enable the GitHub Projects features on the repository. | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | (Optional) Set to true to enable the GitHub Wiki features on the repository. | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | (Optional) URL of a page describing the project. | `string` | `""` | no |
| <a name="input_ignore_vulnerability_alerts_during_read"></a> [ignore\_vulnerability\_alerts\_during\_read](#input\_ignore\_vulnerability\_alerts\_during\_read) | (Optional) Set to true to not call the vulnerability alerts endpoint so the resource can also be used without admin permissions during read. | `bool` | `false` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | (Optional) Set to true to tell GitHub that this is a template repository. | `bool` | `false` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | (Optional) Use the name of the template without the extension. Default is "mit". | `string` | `"mit"` | no |
| <a name="input_merge_commit_message"></a> [merge\_commit\_message](#input\_merge\_commit\_message) | (Optional) Can be PR\_BODY, PR\_TITLE, or BLANK for a default merge commit message. | `string` | `"BLANK"` | no |
| <a name="input_merge_commit_title"></a> [merge\_commit\_title](#input\_merge\_commit\_title) | (Optional) Can be PR\_TITLE or MERGE\_MESSAGE for a default merge commit title. | `string` | `"PR_TITLE"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the repository. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) This is the target GitHub organization or individual user account to manage. | `string` | `null` | no |
| <a name="input_pages"></a> [pages](#input\_pages) | (Optional) The repository's GitHub Pages configuration. | <pre>object({<br>      branch = string<br>      path   = optional(string, "/")<br>      cname  = optional(string, "")<br>    })</pre> | `null` | no |
| <a name="input_repository_branches"></a> [repository\_branches](#input\_repository\_branches) | (Optional) The list of branche names to create in the repository. | `list(string)` | `[]` | no |
| <a name="input_security_and_analysis"></a> [security\_and\_analysis](#input\_security\_and\_analysis) | (Optional) The repository's security and analysis configuration. | <pre>object({<br>      advanced_security = optional(string, "disabled")<br>      secret_scanning   = optional(string, "disabled")<br>      secret_scanning_push_protection  = optional(string, "disabled")<br>    })</pre> | `null` | no |
| <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message) | (Optional) Can be PR\_BODY, COMMIT\_MESSAGES, or BLANK for a default squash merge commit message. | `string` | `"BLANK"` | no |
| <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title) | (Optional) Can be PR\_TITLE or COMMIT\_OR\_PR\_TITLE for a default squash merge commit title. | `string` | `"PR_TITLE"` | no |
| <a name="input_template"></a> [template](#input\_template) | (Optional) Use a template repository to create this resource. | <pre>object({<br>        owner      = string<br>        repository = string<br>        include_all_branches = optional(bool, false)<br>    })</pre> | `null` | no |
| <a name="input_token"></a> [token](#input\_token) | (Optional) A GitHub OAuth / Personal Access Token. | `string` | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | (Optional) The list of topics of the repository. | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | (Optional) Can be public or private or internal. | `string` | `"public"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | (Optional) Set to true to enable security alerts for vulnerable dependencies. | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->