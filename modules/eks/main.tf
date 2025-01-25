resource "aws_eks_cluster" "main" {
  name     = "${var.env}-eks"
  role_arn = aws_iam_role.eks-cluster-role.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_addon" "vpc-cni" {
  for_each = var.addons
  cluster_name = aws_eks_cluster.main.name
  addon_name   = each.key
  addon_version = data.aws_eks_addon_version.add-on-version.version
}
