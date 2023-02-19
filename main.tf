terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# kafka-server.tf
# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "kafka" {
  image  = "ubuntu-20-04-x64"
  name   = "giang-kafka"
  region = "sgp1"
  size   = "s-4vcpu-8gb"
}

resource "digitalocean_ssh_key" "default" {
  name = "terraform-training"
  public_key = file("./kafka.pub")
}

# variables.tf
# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

