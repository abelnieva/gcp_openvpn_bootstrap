resource "google_compute_instance" "vpn-engine-instance" {
  name = "vpn-engine"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  # count        = 2
  # name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["512gig"]}"

  zone = "${var.region}-b"

  scheduling {
    preemptible       = "${var.preemptible}"
    automatic_restart = false
  }

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-vpn",
  ]

  boot_disk {
    initialize_params {
      image = "${var.os["ubuntu-minimal1804"]}"
    }
  }

  metadata {
    hostname = "${var.vpn_hostname}"
    sshKeys  = "${var.gce_vpn_user}:${file(var.gce_vpn_pub_key_file)}"
  }

  provisioner "remote-exec" {
    connection {
      user        = "${var.gce_vpn_user}"
      private_key = "${file(var.gce_vpn_priv_key_file)}"
    }

    inline = [
      "sudo apt-get update",
      "wget https://raw.githubusercontent.com/abelnieva/OpenVPN-install/master/openvpn-install.sh",
      "sudo chmod +x openvpn-install.sh",
      "sudo ./openvpn-install.sh nouser ${var.PROTOCOL} ${var.DNS} ${var.CIPHER} ${var.DH_KEY_SIZE} ${var.RSA_KEY_SIZE} ${var.CLIENT} ${var.PORT}",
    ]
  }

  provisioner "local-exec" {
    command = "scp -oStrictHostKeyChecking=no ${var.gce_vpn_user}@${google_compute_instance.vpn-engine-instance.network_interface.0.access_config.0.assigned_nat_ip }:/home/${var.gce_vpn_user}/${var.CLIENT}.ovpn ./vpn-config"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.vpn_network_subnetwork.name}"

    access_config {
      // Ephemeral IP\
      network_tier = "PREMIUM"
    }
  }
}
