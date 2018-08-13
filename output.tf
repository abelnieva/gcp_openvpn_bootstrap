output "Publicdns" {
  value = "${google_compute_instance.vpn-engine-instance.network_interface.0.access_config.0.assigned_nat_ip }"
}
