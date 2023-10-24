

module "minimum" {
    source = "../.."

    token = ""
    owner = ""
    
    ## REQUIRED
    name = "example-github-repository"

    ## OPTIONAL
    description = "This is a example of a minimum GitHub Repository creation."
    homepage_url = "https://www.example.com"
    topics = ["terraform-module", "reuse", "github-repository"]
}
