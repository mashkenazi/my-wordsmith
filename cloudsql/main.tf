provider "google" {
  #credentials = file("<path_to_your_service_account_key>")
  project = "akiva-ashkenazi"
  region  = "me-west1"
}

resource "google_sql_database_instance" "words-postgresql-instance" {
  name             = "words-postgresql-instance"
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
    disk_autoresize = false
  }
  deletion_protection = true
}

