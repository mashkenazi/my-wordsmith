provider "google" {
  #credentials = file("<path_to_your_service_account_key>")
  project = "akiva-ashkenazi"
  region  = "me-west1"
}

resource "google_container_cluster" "words-gke-autopilot-cluster" {
  name               = "words-gke-autopilot-cluster"
  location           = "me-west1"
  remove_default_node_pool = true
  initial_node_count = 1
}