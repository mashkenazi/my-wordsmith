provider "google" {
  #credentials = file("<path_to_your_service_account_key>")
  project = "akiva-ashkenazi"
  region  = "me-west1"
}

resource "google_container_cluster" "words-gke-autopilot-cluster" {
  name               = "words-gke-autopilot-cluster"
  initial_node_count = 1
  remove_default_node_pool = true
  location = "me-west1"
}

resource "google_container_node_pool" "default-pool" {
  autoscaling {
    max_node_count = 20
    min_node_count = 1
  }
  cluster = "words-gke-autopilot-cluster"
  initial_node_count = 1
  name = "default-pool"
  location = "me-west1"
  depends_on = [google_container_cluster.words-gke-autopilot-cluster]
}