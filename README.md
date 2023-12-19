# ArgoCD-EKS-Terraform
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.8.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.12.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.16.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.1.2 |

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | Ami Type for Ec2 instances created in Cluster | `string` | `"AL2_x86_64"` | no |
| <a name="input_argocd_helm_chart"></a> [argocd\_helm\_chart](#input\_argocd\_helm\_chart) | Argocd Helm chart name | `string` | `"argo-cd"` | no |
| <a name="input_argocd_helm_chart_timeout_seconds"></a> [argocd\_helm\_chart\_timeout\_seconds](#input\_argocd\_helm\_chart\_timeout\_seconds) | Timeout value for Helm chart install/upgrade operations | `number` | `300` | no |
| <a name="input_argocd_helm_chart_version"></a> [argocd\_helm\_chart\_version](#input\_argocd\_helm\_chart\_version) | ArgoCD Helm chart version to deploy | `string` | `"5.16.14"` | no |
| <a name="input_argocd_helm_release_name"></a> [argocd\_helm\_release\_name](#input\_argocd\_helm\_release\_name) | Argocd Helm release name | `string` | `"argocd"` | no |
| <a name="input_argocd_helm_repo"></a> [argocd\_helm\_repo](#input\_argocd\_helm\_repo) | ArgoCD Helm chart repository URL | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_argocd_k8s_namespace"></a> [argocd\_k8s\_namespace](#input\_argocd\_k8s\_namespace) | Kubernetes namespace to use for the argocd Helm release | `string` | `"argocd"` | no |
| <a name="input_aws_availability_zones"></a> [aws\_availability\_zones](#input\_aws\_availability\_zones) | AWS availability zones | `list` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Set this variable if you use another profile besides the default awscli profile called 'default'. | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Set this variable if you use another aws region. | `string` | `"us-east-1"` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Cird block for your VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | kubernetes cluster version | `string` | `"1.27"` | no |
| <a name="input_enable_argocd_helm_release"></a> [enable\_argocd\_helm\_release](#input\_enable\_argocd\_helm\_release) | Enable/disable ArgoCD Helm chart deployment on EKS | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | it would be a prefix for you cluster name created, typically specified as dev or test | `string` | `"dev"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | private subnets to create, need to have 1 for each AZ | `list` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | public subnets to create, need to have 1 for each AZ | `list` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24",<br>  "10.0.6.0/24"<br>]</pre> | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Vpc name that would be created for your cluster | `string` | `"EKS_vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connect_to_eks"></a> [connect\_to\_eks](#output\_connect\_to\_eks) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
<!-- END_TF_DOCS -->