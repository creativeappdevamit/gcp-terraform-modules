resource "google_compute_security_policy" "armor-policy" {
  name        = var.policy_name
  project     = var.project_id
  description = var.description

  rule {
    action      = "deny(403)"
    priority    = "2147483647"
    description = "Default rule: deny all"

    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
  }
  dynamic "rule" {
    for_each = chunklist(var.ip_allow_list, 10)
    # Whitelist traffic from certain ip address
    content {
      action      = "allow"
      priority    = 2147483646 - rule.key
      description = "Allow the listed ips"
      match {
        versioned_expr = "SRC_IPS_V1"
        config {
          src_ip_ranges = rule.value
        }
      }
    }
  }
}