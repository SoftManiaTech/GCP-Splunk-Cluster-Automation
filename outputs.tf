output "instance_public_ips" {
  value = merge(
    { for k, inst in google_compute_instance.splunk_server_asia_southeast1 : k => inst.network_interface[0].access_config[0].nat_ip },
    { for k, inst in google_compute_instance.splunk_server_asia_east1      : k => inst.network_interface[0].access_config[0].nat_ip },
    { for k, inst in google_compute_instance.splunk_server_asia_east2      : k => inst.network_interface[0].access_config[0].nat_ip }
  )
}

output "instance_private_ips" {
  value = merge(
    { for k, inst in google_compute_instance.splunk_server_asia_southeast1 : k => inst.network_interface[0].network_ip },
    { for k, inst in google_compute_instance.splunk_server_asia_east1      : k => inst.network_interface[0].network_ip },
    { for k, inst in google_compute_instance.splunk_server_asia_east2      : k => inst.network_interface[0].network_ip }
  )
}
