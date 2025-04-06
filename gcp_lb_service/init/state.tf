locals {
  terraform_state_bucket_and_table_name = "structure-gcp-terraform-state"
  project_id = "qwiklabs-gcp-03-40bf60fc953e"
}

provider "google" {

  project = "${local.project_id}"
  region  = "us-west1"
  zone    = "us-west1-c"
}

resource "google_storage_bucket" "terraform_state_bucket" {
  name          = "${local.terraform_state_bucket_and_table_name}" # Globally unique name
  location      = "US"                                # Choose your desired location
  project       = "${local.project_id}"
  storage_class = "STANDARD"

  # Recommended: Enable uniform bucket-level access for security
  uniform_bucket_level_access = true

  # Recommended: Enable versioning to track state changes
  versioning {
    enabled = true
  }

  # Optional: Prevent accidental deletion of the bucket if it contains objects
  #force_destroy = false
}