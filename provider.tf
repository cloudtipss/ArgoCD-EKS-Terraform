provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

### need to update
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }
  }
  # Enable the "cloud" block if you are using Terraform cloud 
  # Swap workspaces between "staging" and "dev"
  #   cloud {
  #     organization = "diabhey"
  #     workspaces {
  #       name = "staging"
  #     }
  #   }
}

locals {
  # eks_config         = module.eks.kube_config[0].raw_config
  eks_endpoint       = module.eks.cluster_endpoint
  # eks_token          = module.eks.kube_config[0].token
  eks_ca_certificate = module.eks.cluster_certificate_authority_data
}

provider "kubernetes" {
  host  = local.eks_endpoint
  # token = local.eks_token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
    command     = "aws"
  }
  cluster_ca_certificate = base64decode(
    local.eks_ca_certificate
  )
}

# provider "helm" {
#   kubernetes {
#     host  = local.eks_endpoint
#     token = local.eks_token
#     cluster_ca_certificate = base64decode(
#       local.eks_ca_certificate
#     )
#   }
# }
provider "helm" {
  kubernetes {
    host                   = local.eks_endpoint
    cluster_ca_certificate = base64decode(
      local.eks_ca_certificate
    )
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
      command     = "aws"
    }
  }
}