module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "poc-eks"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
    access_entries = {
    student-admin = {
      principal_arn = "arn:aws:iam::339333478576:user/student01"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }


  eks_managed_node_groups = {

    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 2

      instance_types = ["t3.micro"]

      subnet_ids = module.vpc.private_subnets
    }
  }

  tags = {
    Environment = "poc"
  }
}