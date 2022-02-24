resource "google_compute_firewall" "firewall" {
  name    = "${var.name}-firewall"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3000", "3001"]
  }

  source_tags = ["node-app"]
}

resource "google_project_service" "iap-api" {
  service            = "iap.googleapis.com"
  disable_on_destroy = false
}
