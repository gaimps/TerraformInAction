terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "alphenix"
    token        = "vYBgFNwsIExJ2A.atlasv1.WAGrK0XQ6gAsmNfc7QjwZGyAxwU52pNjoVF588jVmXtp0yan8yDz8c5MDkPd5GLvuBo"
    workspaces {
      name = "TerraformInAction"
    }
  }
}
