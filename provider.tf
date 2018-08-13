provider "google" {
  credentials = "${file("credentials.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
