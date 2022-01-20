module "binance-ocr-cluster" {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  project_id              = var.project_id 
  name                    = var.cluster_name
  region                  = var.region
  zones                   = var.zone
  network                 = "default"
  subnetwork              = "default"
  ip_range_pods           = ""
  ip_range_services       = ""
  http_load_balancing     = true
  horizontal_pod_autoscaling = true
  cluster_resource_labels = { "chainlink_node" : "${var.cluster_name}" }

  node_pools = [
    {
      name         = "${var.cluster_name}-node-pool"
      machine_type       = "n1-standard-2"
      min_count          = 1
      max_count          = 5
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
      initial_node_count = 2
    },
  ]
}