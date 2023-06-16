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

# github
resource "github_repository" "github_repository" {
  name       = "github"
  visibility = "public"
}

resource "github_branch_protection" "github_protection" {
  repository_id  = github_repository.github_repository.node_id
  pattern        = "main"
  enforce_admins = true
}

# linebot
resource "github_repository" "linebot_repository" {
  name       = "linebot"
  visibility = "public"
}

resource "github_branch_protection" "linebot_protection" {
  repository_id  = github_repository.linebot_repository.node_id
  pattern        = "main"
  enforce_admins = true
}

# masawai
resource "github_repository" "masawai_repository" {
  name       = "masawai"
  visibility = "public"
}

resource "github_branch_protection" "masawai_protection" {
  repository_id  = github_repository.masawai_repository.node_id
  pattern        = "main"
  enforce_admins = true
}

# jumble
resource "github_repository" "jumble_repository" {
  name       = "jumble"
  visibility = "public"
}

resource "github_branch_protection" "jumble_protection" {
  repository_id  = github_repository.jumble_repository.node_id
  pattern        = "main"
  enforce_admins = true
}

