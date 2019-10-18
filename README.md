# Docker via Terraform on GCP
This project will leverage GCP to quickly land a google compute instance with docker installed. Firewall rules are strict and disallow inbound ports including SSH. To deploy scripts without SSH I used templates and GCP's metadata startup script. This instance should be always free and a new account comes with $300 usable during the first 12 months.

### Prerequisites
Install Terraform and Git. I suggest using chocolatey for Windows or homebrew for Mac. 

## Getting Started
1. Create Google Cloud Platform account
2. Take note of your generated project name and ID (or [create your own project name](https://console.cloud.google.com/cloud-resource-manager?_ga=2.152268665.-1101307456.1571267735))
3. [Create a service account](https://cloud.google.com/video-intelligence/docs/common/auth#creating_a_service_account_in_the) and download your subsequent JSON key

## Installation
1. Clone Repo and run terraform init
   ```
   git clone https://github.com/terraformed/terraform-docker-gcp.git
   cd ./terraform-docker-gcp
   terraform init
   ```
2. Copy downloaded json credential file to this project location and rename it to gcp-key.json
3. Modify gcp_project value in vars.tf to match the your project ID in google cloud
4. Execute Terraform plan and apply
   ```
   terraform plan
   terraform apply -auto-approve
   ```
5. Log into GCP console and confirm your docker container(s) is running
   ```
   sudo docker container ls #on google cloud vm instance
   ```
By default I included a postgres db but you can put specify containers in docker-compose-build.tpl which becomes docker-compose.yml on the host.

### Optional
To enable 80 and 443 uncomment the 'tags' line in main.tf

## Acknowledgments:
https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform
