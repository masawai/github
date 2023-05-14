terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = "masawai"
  token = var.github_token
}


resource "github_repository" "github" {
  name = "github"

  visibility = "public"
}

resource "github_branch_protection" "example" {
  repository_id  = github_repository.github.node_id
  pattern        = "main"
  enforce_admins = true

  # required_pull_request_reviews {
  #   dismiss_stale_reviews = true
  # require_code_owner_reviews = true
  # required_approving_review_count = 2
  # }

}

output "github" {
  value = github_repository.github.git_clone_url
}
