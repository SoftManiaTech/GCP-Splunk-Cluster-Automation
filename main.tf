terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "google" {
  alias       = "asia_southeast1"
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "asia-southeast1"
  zone        = "asia-southeast1-a"
}

provider "google" {
  alias       = "asia_east1"
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "asia-east1"
  zone        = "asia-east1-a"
}

provider "google" {
  alias       = "asia_east2"
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "asia-east2"
  zone        = "asia-east2-a"
}

locals {
  # Group instances by region for easier resource creation per provider alias
  instances_by_region = {
    asia_southeast1 = { for k, v in var.instances : k => v if v.region == "asia-southeast1" }
    asia_east1      = { for k, v in var.instances : k => v if v.region == "asia-east1" }
    asia_east2      = { for k, v in var.instances : k => v if v.region == "asia-east2" }
  }
}

##########
# FIREWALLS
##########

resource "google_compute_firewall" "splunk_fw_asia_southeast1" {
  provider = google.asia_southeast1
  for_each = local.instances_by_region["asia_southeast1"]

  name    = "splunk-fw-${lower(replace(each.value.name, "_", "-"))}"
  network = "default"
  direction = "INGRESS"

  dynamic "allow" {
    for_each = each.value.security_group_rules
    content {
      protocol = allow.value.protocol
      ports    = [tostring(allow.value.from_port)]
    }
  }

  source_ranges = flatten([for rule in each.value.security_group_rules : rule.cidr_blocks])
}

resource "google_compute_firewall" "splunk_fw_asia_east1" {
  provider = google.asia_east1
  for_each = local.instances_by_region["asia_east1"]

  name    = "splunk-fw-${lower(replace(each.value.name, "_", "-"))}"
  network = "default"
  direction = "INGRESS"

  dynamic "allow" {
    for_each = each.value.security_group_rules
    content {
      protocol = allow.value.protocol
      ports    = [tostring(allow.value.from_port)]
    }
  }

  source_ranges = flatten([for rule in each.value.security_group_rules : rule.cidr_blocks])
}

resource "google_compute_firewall" "splunk_fw_asia_east2" {
  provider = google.asia_east2
  for_each = local.instances_by_region["asia_east2"]

  name    = "splunk-fw-${lower(replace(each.value.name, "_", "-"))}"
  network = "default"
  direction = "INGRESS"

  dynamic "allow" {
    for_each = each.value.security_group_rules
    content {
      protocol = allow.value.protocol
      ports    = [tostring(allow.value.from_port)]
    }
  }

  source_ranges = flatten([for rule in each.value.security_group_rules : rule.cidr_blocks])
}


# ELASTIC IP (STATIC IP)


resource "google_compute_address" "splunk_eip_asia_southeast1" {
  provider = google.asia_southeast1
  for_each = { for k, v in local.instances_by_region["asia_southeast1"] : k => v if v.elastic_ip_needed }

  name   = "splunk-eip-${lower(replace(each.value.name, "_", "-"))}"
  region = each.value.region
}

resource "google_compute_address" "splunk_eip_asia_east1" {
  provider = google.asia_east1
  for_each = { for k, v in local.instances_by_region["asia_east1"] : k => v if v.elastic_ip_needed }

  name   = "splunk-eip-${lower(replace(each.value.name, "_", "-"))}"
  region = each.value.region
}

resource "google_compute_address" "splunk_eip_asia_east2" {
  provider = google.asia_east2
  for_each = { for k, v in local.instances_by_region["asia_east2"] : k => v if v.elastic_ip_needed }

  name   = "splunk-eip-${lower(replace(each.value.name, "_", "-"))}"
  region = each.value.region
}


# COMPUTE INSTANCES


resource "google_compute_instance" "splunk_server_asia_southeast1" {
  provider = google.asia_southeast1
  for_each = local.instances_by_region["asia_southeast1"]

  name         = lower(replace(each.value.name, "_", "-"))
  machine_type = each.value.instance_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = lookup({
        "rhel-9" = "projects/rhel-cloud/global/images/family/rhel-9"
      }, each.value.os_type, "projects/rhel-cloud/global/images/family/rhel-9")
      size  = each.value.storage_size
    }
  }

  network_interface {
    network    = "default"
    subnetwork = var.subnetwork

    access_config {
      nat_ip = lookup(google_compute_address.splunk_eip_asia_southeast1, each.key, null) != null ? google_compute_address.splunk_eip_asia_southeast1[each.key].address : null
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  tags = [lower(replace(each.value.name, "_", "-")), "splunk"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = file("splunk-setup.sh")
}

resource "google_compute_instance" "splunk_server_asia_east1" {
  provider = google.asia_east1
  for_each = local.instances_by_region["asia_east1"]

  name         = lower(replace(each.value.name, "_", "-"))
  machine_type = each.value.instance_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = lookup({
        "rhel-9" = "projects/rhel-cloud/global/images/family/rhel-9"
      }, each.value.os_type, "projects/rhel-cloud/global/images/family/rhel-9")
      size  = each.value.storage_size
    }
  }

  network_interface {
    network    = "default"
    subnetwork = var.subnetwork

    access_config {
      nat_ip = lookup(google_compute_address.splunk_eip_asia_east1, each.key, null) != null ? google_compute_address.splunk_eip_asia_east1[each.key].address : null
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  tags = [lower(replace(each.value.name, "_", "-")), "splunk"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = file("splunk-setup.sh")
}

resource "google_compute_instance" "splunk_server_asia_east2" {
  provider = google.asia_east2
  for_each = local.instances_by_region["asia_east2"]

  name         = lower(replace(each.value.name, "_", "-"))
  machine_type = each.value.instance_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = lookup({
        "rhel-9" = "projects/rhel-cloud/global/images/family/rhel-9"
      }, each.value.os_type, "projects/rhel-cloud/global/images/family/rhel-9")
      size  = each.value.storage_size
    }
  }

  network_interface {
    network    = "default"
    subnetwork = var.subnetwork

    access_config {
      nat_ip = lookup(google_compute_address.splunk_eip_asia_east2, each.key, null) != null ? google_compute_address.splunk_eip_asia_east2[each.key].address : null
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  tags = [lower(replace(each.value.name, "_", "-")), "splunk"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = file("splunk-setup.sh")
}

locals {
  all_instances = merge(
    google_compute_instance.splunk_server_asia_southeast1,
    google_compute_instance.splunk_server_asia_east1,
    google_compute_instance.splunk_server_asia_east2
  )

  instances_metadata = {
    for k, inst in local.all_instances : k => {
      public_ip   = inst.network_interface[0].access_config[0].nat_ip
      private_ip  = inst.network_interface[0].network_ip
      instance_id = inst.instance_id
    }
  }
}


resource "local_file" "ansible_inventory" {
  filename = "inventory.ini"

  content = join("\n", flatten([
    # Indexers group
    "[indexers]",
    [for name in ["idx1", "idx2", "idx3"] :
      contains(keys(local.instances_metadata), name) ?
      format("%s ansible_host=%s instance_id=%s ansible_user=%s",
        name,
        local.instances_metadata[name].public_ip,
        local.instances_metadata[name].instance_id,
        var.ssh_user) : ""
    ],

    # ClusterManager group (add this block)
    "[ClusterManager]",
    contains(keys(local.instances_metadata), "clustermanager") ?
    format("clustermanager ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["clustermanager"].public_ip,
      local.instances_metadata["clustermanager"].instance_id,
      var.ssh_user) : "",

    # SH1, SH2, SH3 groups
    "[SH1]",
    contains(keys(local.instances_metadata), "SH1") ?
    format("SH1 ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["SH1"].public_ip,
      local.instances_metadata["SH1"].instance_id,
      var.ssh_user) : "",

    "[SH2]",
    contains(keys(local.instances_metadata), "SH2") ?
    format("SH2 ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["SH2"].public_ip,
      local.instances_metadata["SH2"].instance_id,
      var.ssh_user) : "",

    "[SH3]",
    contains(keys(local.instances_metadata), "SH3") ?
    format("SH3 ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["SH3"].public_ip,
      local.instances_metadata["SH3"].instance_id,
      var.ssh_user) : "",

    # search_heads group with all three SH hosts
    "[search_heads]",
    [for name in ["SH1", "SH2", "SH3"] :
      contains(keys(local.instances_metadata), name) ?
      format("%s ansible_host=%s instance_id=%s ansible_user=%s",
        name,
        local.instances_metadata[name].public_ip,
        local.instances_metadata[name].instance_id,
        var.ssh_user) : ""
    ],

    # Deployment_Server group
    "[Deployment_Server]",
    contains(keys(local.instances_metadata), "Deployment-Server") ?
    format("Deployment_Server ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["Deployment-Server"].public_ip,
      local.instances_metadata["Deployment-Server"].instance_id,
      var.ssh_user) : "",

    # Management_server group
    "[Management_server]",
    contains(keys(local.instances_metadata), "Management_server") ?
    format("Management_server ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["Management_server"].public_ip,
      local.instances_metadata["Management_server"].instance_id,
      var.ssh_user) : "",

    # Deployer group
    "[Deployer]",
    contains(keys(local.instances_metadata), "Deployer") ?
    format("Deployer ansible_host=%s instance_id=%s ansible_user=%s",
      local.instances_metadata["Deployer"].public_ip,
      local.instances_metadata["Deployer"].instance_id,
      var.ssh_user) : "",

    # IFs group with two hosts
    "[IFs]",
    [for name in ["IF1", "IF2"] :
      contains(keys(local.instances_metadata), name) ?
      format("%s ansible_host=%s instance_id=%s ansible_user=%s",
        name,
        local.instances_metadata[name].public_ip,
        local.instances_metadata[name].instance_id,
        var.ssh_user) : ""
    ],

    # All_splunk children group
    "[all_splunk:children]",
    "ClusterManager",
    "indexers",
    "search_heads",
    "Deployment_Server",
    "Deployer"
  ]))
}


resource "local_file" "ansible_group_vars" {
  filename = "group_vars/all.yml"

  content = templatefile("${path.module}/group_vars_template.yml", {
  cluster_manager   = [local.instances_metadata["clustermanager"]]
  indexers          = { for name in ["idx1", "idx2", "idx3"] : name => local.instances_metadata[name] if contains(keys(local.instances_metadata), name) }
  search_heads      = { for name in ["SH1", "SH2", "SH3"] : name => local.instances_metadata[name] if contains(keys(local.instances_metadata), name) }
  deployment_server = contains(keys(local.instances_metadata), "Deployment-Server") ? [local.instances_metadata["Deployment-Server"]] : []
  Management_server = contains(keys(local.instances_metadata), "Management_server") ? [local.instances_metadata["Management_server"]] : []  # <== Capital M here
  deployer          = contains(keys(local.instances_metadata), "Deployer") ? [local.instances_metadata["Deployer"]] : []
  ifs               = { for name in ["IF1", "IF2"] : name => local.instances_metadata[name] if contains(keys(local.instances_metadata), name) }
  splunk_license_url = var.splunk_license_url
  splunk_admin_password = "admin123"
})

}
