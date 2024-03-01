terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.16.0"
    }
  }
}

provider "google" {
  credentials = "./keys/fiery-topic-414915-0dd7735c4180.json"
  project     = "fiery-topic-414915"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "yedyge_bucket_check"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}