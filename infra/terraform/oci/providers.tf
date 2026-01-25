terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  region              = "ap-sydney-1"
  auth                = "SecurityToken"
  config_file_profile = "homelab"
}
