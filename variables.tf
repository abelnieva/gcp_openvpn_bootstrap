variable "region" {
  default = "southamerica-east1" # sao paulo
}

variable "project-name" {
  default = "studious-spirit-210919"
}

variable "subnetwork-region" {
  default = "southamerica-east1-b"
}

variable "network" {
  default = "vpn-network"
}

variable "vm_type" {
  default {
    "512gig"     = "f1-micro"
    "1point7gig" = "g1-small"
    "7point5gig" = "n1-standard-2"
  }
}

variable "os" {
  default {
    "centos7"            = "centos-7-v20170816"
    "debian9"            = "debian-9-stretch-v20170816"
    "ubuntu-1604-lts"    = "ubuntu-1604-xenial-v20170815a"
    "ubuntu-1704"        = "ubuntu-1704-zesty-v20170811"
    "ubuntu-minimal1804" = "ubuntu-minimal-1804-bionic-v20180806a"
  }
}

variable "PROTOCOL" {
  default = "UDP"

  // It can be UDP or TCP
}

variable "DNS" {
  default = 1

  /*
	echo "What DNS do you want to use with the VPN?"
	echo "   1) Current system resolvers (from /etc/resolv.conf)"
	echo "   2) Cloudflare (Anycast: worldwide)"
	echo "   3) Quad9 (Anycast: worldwide)"
	echo "   4) FDN (France)"
	echo "   5) DNS.WATCH (Germany)"
	echo "   6) OpenDNS (Anycast: worldwide)"
	echo "   7) Google (Anycast: worldwide)"
	echo "   8) Yandex Basic (Russia)"
	echo "   9) AdGuard DNS (Russia)"
*/
}

variable "CIPHER" {
  default = 1

  /*
  	echo "Choose which cipher you want to use for the data channel:"
	echo "   1) AES-128-CBC (fastest and sufficiently secure for everyone, recommended)"
	echo "   2) AES-192-CBC"
	echo "   3) AES-256-CBC"
	echo "Alternatives to AES, use them only if you know what you're doing."
	echo "They are relatively slower but as secure as AES."
	echo "   4) CAMELLIA-128-CBC"
	echo "   5) CAMELLIA-192-CBC"
	echo "   6) CAMELLIA-256-CBC"
	echo "   7) SEED-CBC"
  */
}

variable "DH_KEY_SIZE" {
  default = 1

  /*
  	echo "Choose what size of Diffie-Hellman key you want to use:"
	echo "   1) 2048 bits (fastest)"
	echo "   2) 3072 bits (recommended, best compromise)"
	echo "   3) 4096 bits (most secure)"
  */
}

variable "RSA_KEY_SIZE" {
  default = 1

  /*
  	echo "Choose what size of RSA key you want to use:"
	echo "   1) 2048 bits (fastest)"
	echo "   2) 3072 bits (recommended, best compromise)"
	echo "   3) 4096 bits (most secure)"
  */
}

variable "CLIENT" {
  default = "vpn-test"

  /*	echo "Finally, tell me a name for the client certificate and configuration"
*/
}

variable "PORT" {
  default = 1194

  /*default port 1194*/
}

variable "gce_vpn_user" {
  default = "ubuntu"
}

variable "gce_vpn_pub_key_file" {
  default = "/home/abel/.ssh/id_rsa.pub"
}

variable "gce_vpn_priv_key_file" {
  default = "/home/abel/.ssh/id_rsa"
}

variable "preemptible" {
  default = true
}

variable "vpn_hostname" {
  default = "vpn.abel.com"
}

variable "VPNasDefaultGW" {
  default = 0

  /*
  0 - NO 
  1 - YES
  */
}

variable "sudo_passwd" {}
