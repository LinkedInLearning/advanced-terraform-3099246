output "webserver-ips" {
    value = [for instance in google_compute_instance.web-instances : instance.network_interface[0].network_ip ]
}