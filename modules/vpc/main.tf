resource "google_compute_network" "net" {
  name                    = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.name
  network                  = google_compute_network.net.name
  region                   = var.region
  ip_cidr_range            = var.ip_cidr_range
  private_ip_google_access = true
}

resource "google_compute_router" "nat_router" {
  name    = "${var.name}-nat-router"
  network = google_compute_network.net.id
  region  = var.region
}

resource "google_compute_router_nat" "nat_router_nat" {
  name                               = "${var.name}-nat"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
}
