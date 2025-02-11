resource "null_resource" "kube-bootstrap" {
  depends_on = [aws_eks_cluster.main, aws_eks_node_group.main]
  provisioner "local-exec" {
    command = <<EOF
aws eks update-kubeconfig --name ${var.env}-eks
kubectl create ns devops
EOF
  }
}

resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-bootstrap]
  chart = "oci://ghcr.io/nginx/charts/nginx-ingress"
  name  = "nginx-ingress"
  namespace = "devops"
  wait = true

  values = [
    file("${path.module}/helm-config/nginx-ingress.yml")
  ]
}

## Extenal DNS
resource "helm_release" "external-dns" {
  depends_on = [null_resource.kube-bootstrap, helm_release.nginx-ingress]
  name             = "external-dns"
  repository       = "https://kubernetes-sigs.github.io/external-dns"
  chart            = "external-dns"
  namespace        = "devops"
  create_namespace = true
  wait             = false
}


## ArgoCD Setup
resource "helm_release" "argocd" {
  depends_on = [null_resource.kube-bootstrap, helm_release.external-dns]
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  wait             = false
  set {
    name  = "global.domain"
    value = "argocd-${var.env}.tejadevopsb81.icu"
  }
  values = [
    file("${path.module}/helm-config/argocd.yml")
  ]
}


## Prometheus Stack Setup
resource "helm_release" "prom-stack" {
  depends_on = [null_resource.kube-bootstrap, helm_release.external-dns]
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "devops"
  create_namespace = true
  wait             = false
  values = [
    file("${path.module}/helm-config/prom-stack.yml")
  ]
}


## External Secrets
resource "helm_release" "external-secrets" {
  depends_on = [null_resource.kube-bootstrap]
  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "devops"
  create_namespace = true
  wait             = true
}

resource "null_resource" "external-secret" {
  depends_on = [helm_release.external-secrets]
  provisioner "local-exec" {
    command = <<EOF
kubectl apply -f - <<EOK
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
data:
  token: aHZzLkRvemJYWHdKYmVrbVpnYnB2UnZ5U1U2OQ==
---
apiVersion: external-secrets.io/v1beta1
kind: ClusterSecretStore
metadata:
  name: vault-backend
spec:
  provider:
    vault:
      server: "http://vault-internal.tejadevopsb81.icu:8200"
      path: "roboshop-${var.env}"
      version: "v2"
      auth:
        tokenSecretRef:
          name: "vault-token"
          key: "token"
EOK
EOF
  }
}

## Filebeat Helm Chart
resource "helm_release" "filebeat" {
  depends_on = [null_resource.kube-bootstrap]
  name       = "filebeat"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
  namespace  = "kube-system"
  wait       = "false"
  values = [
    file("${path.module}/helm-config/filebeat.yaml")
  ]
}