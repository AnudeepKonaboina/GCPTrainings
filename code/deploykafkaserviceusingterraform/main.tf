provider "google" {
  credentials = var.credentials
  project     = "gcptutorials"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
}


resource "google_app_engine_flexible_app_version" "first_app" {
  version_id = "v1"
  project    = "gcptutorials"
  service    = "kafka-service"
  runtime    = "custom"

  deployment {
   container {
     image = "asia.gcr.io/gcptutorials/kafka-image"
   }
  }

  liveness_check {
    path = "/"
  }

  readiness_check {
    path = "/"
  }

  automatic_scaling {
    cool_down_period = "120s"
    cpu_utilization {
      target_utilization = 0.8
    }
  }
}


