resource "google_storage_bucket" "class1Bucket" {

    name = "reddyredyyasjduwdkjscxmueiwal"
    location = "us"
    storage_class = "STANDARD"
    force_destroy = true

    labels = {
      "env" = "dev"
      "compliance" = "yes"
    
    }
    uniform_bucket_level_access = true

    lifecycle_rule {

      condition {
        age = 5
      }
      action {
        type = "setStorageClass"
        storage_class = "NEARLINE"
      }
    }
    retention_policy {
      is_locked = true
      retention_period = 3660
    }
    website{
        main_page_suffix = "index.html"
        not_found_page = "404.html"
    }
    public_access_prevention = "enforced"
    hierarchical_namespace {
      enabled = true
    }
    cors {
      
    }
  
}

resource "google_storage_bucket_object" "picture" {

    name = "Keys-Files"
    bucket = google_storage_bucket.class1Bucket.name
    source = "keys-gcp.json"
}

resource "google_storage_bucket_iam_member" "iampolicy" {
  bucket = google_storage_bucket.class1Bucket
  role = "roles/storage.objectViewer"
  member = "user:example@example.com"
}