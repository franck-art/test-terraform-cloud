resource "google_compute_instance" "default" {
  name         = var.name_instance
  machine_type = var.type_machine 
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  labels = {
 x = "y"
 g = "f"

  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
