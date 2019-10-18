// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("gcp-key.json")}"
 project     = "${var.gcp_project}"
 region      = "${var.gcp_region}"
}
