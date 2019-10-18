variable "gcp_project" {
    default = "<<NAME OF PROJECT GOES HERE>>"
}

variable "gcp_region" {
    default = "us-east1-b"
}

data "template_file" "docker-script-build" {
  template = "${file("templates/docker-script-build.tpl")}"
}

data "template_file" "docker-compose-build" {
  template = "${file("templates/docker-compose-build.tpl")}"
}

data "template_file" "execute-shell" {
  template = "${file("templates/execute-shell.tpl")}"
}
