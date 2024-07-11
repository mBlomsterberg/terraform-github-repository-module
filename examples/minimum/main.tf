

module "minimum" {
    source = "../.."

    token = ""
    owner = ""
    codeowners = ["@mBlomsterberg"]
    
    ## REQUIRED
    name = "example-github-repository"

    ## OPTIONAL
    description = "This is a example of a minimum GitHub Repository creation."
    homepage_url = "https://www.example.com"
    topics = ["terraform-module", "reuse", "github-repository"]

    template = {
        owner = "mBlomsterberg"
        repository = "hanayama-repository-standard"
        include_all_branches = true
    }
}
