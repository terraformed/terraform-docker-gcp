// Terraform plugin for creating random ids
// https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "gcp-cloud-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "${var.gcp_region}"

# tags = ["http-server","https-server"] #uncomment to allow 80 and or 443

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 metadata = {
  startup-script = <<SCRIPT
  ${data.template_file.docker-script-build.rendered}
  ${data.template_file.docker-compose-build.rendered}
  ${data.template_file.execute-shell.rendered}
  SCRIPT
 }
  
 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address

   }
 }
}
