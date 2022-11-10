locals {
  data = var.replica_name == null ? { instance-connection-name = "${var.project_id}:${var.region}:${var.instance_name}"
    reporting-connection-name = "${var.project_id}:${var.region}:${var.reporting_name}" } : { instance-connection-name = "${var.project_id}:${var.region}:${var.instance_name}"
    reporting-connection-name = "${var.project_id}:${var.region}:${var.reporting_name}"
  replica-connection-name = "${var.project_id}:${var.region}:${var.replica_name}" }
}
resource "kubernetes_secret" "proxy_credentials" {
  metadata {
    name      = "cloudsql-proxy-credentials"
    namespace = "default"
    annotations = {
      "replicator.v1.mittwald.de/replication-allowed"            = "true",
      "replicator.v1.mittwald.de/replication-allowed-namespaces" = ".*"
    }
  }
  type = "Opaque"
  data = {
    "credentials.json" = base64decode(var.proxy_credentials)
  }
}

resource "kubernetes_config_map" "example" {
  metadata {
    name      = "cloudsql-proxy-config"
    namespace = "default"
    annotations = {
      "replicator.v1.mittwald.de/replication-allowed"            = "true",
      "replicator.v1.mittwald.de/replication-allowed-namespaces" = ".*"
    }
  }

  data = local.data
}
