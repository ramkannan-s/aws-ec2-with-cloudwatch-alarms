terraform {
  /*  backend "remote" {
    hostname     = "psapac.jfrog.io"
    organization = "terraform-workshop"
    workspaces {
      prefix = "tech-demo-2024"
    }
  } */
  backend "local" {
    path = "./terraform.tfstate"
  }
}
