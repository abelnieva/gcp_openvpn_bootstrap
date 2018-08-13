resource "google_compute_firewall" "ssh" {
  name    = "${var.network}-firewall-ssh"
  network = "${google_compute_network.vpn_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["${var.network}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "vpn" {
  name    = "${var.network}-firewall-vpn"
  network = "${google_compute_network.vpn_network.name}"

  allow {
    protocol = "${var.PROTOCOL}"
    ports    = ["${var.PORT}"]
  }

  target_tags   = ["${var.network}-firewall-vpn"]
  source_ranges = ["0.0.0.0/0"]
}
