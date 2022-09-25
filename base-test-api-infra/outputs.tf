// A variable for extracting the external IP address of the VM
output "Web-server-URL" {
  value = join("", ["http://", google_compute_instance.default.network_interface.0.access_config.0.nat_ip, ":8080"])
}

output "artifact_registry_id" {
  value = google_artifact_registry_repository.base-test-api.id
}
