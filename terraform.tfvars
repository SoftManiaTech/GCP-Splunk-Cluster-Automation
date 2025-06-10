credentials_file = "<GCP_SERVICE_ACCOUNT_KEY_FILE_NAME>"
project_id       = "<ADD_PROJECT_ID>"
subnetwork       = "default"
splunk_license_url = "<splunk_license_direct_link>"
ssh_user       = "root"
ssh_public_key = "<SSH_PUBLIC_KEY>"


instances = {
  clustermanager = {
    name              = "Clustermanager"
    instance_type     = "e2-medium"
    region            = "asia-southeast1"
    zone              = "asia-southeast1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  idx1 = {
    name              = "idx1"
    instance_type     = "e2-medium"
    region            = "asia-southeast1"
    zone              = "asia-southeast1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  idx2 = {
    name              = "idx2"
    instance_type     = "e2-medium"
    region            = "asia-southeast1"
    zone              = "asia-southeast1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  idx3 = {
    name              = "idx3"
    instance_type     = "e2-medium"
    os_type           = "rhel-9"
    region            = "asia-southeast1"
    zone              = "asia-southeast1-a"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  SH1 = {
    name              = "SH1"
    instance_type     = "e2-medium"
    region            = "asia-east1"
    zone              = "asia-east1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  SH2 = {
    name              = "SH2"
    instance_type     = "e2-medium"
    region            = "asia-east1"
    zone              = "asia-east1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  SH3 = {
    name              = "SH3"
    instance_type     = "e2-medium"
    region            = "asia-east1"
    zone              = "asia-east1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  "Deployment-Server" = {
    name              = "Deployment-Server"
    instance_type     = "e2-medium"
    region            = "asia-east1"
    zone              = "asia-east1-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  Management_server = {
    name              = "Management_server"
    instance_type     = "e2-medium"
    region            = "asia-east2"
    zone              = "asia-east2-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  Deployer = {
    name              = "Deployer"
    instance_type     = "e2-medium"
    region            = "asia-east2"
    zone              = "asia-east2-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  IF1 = {
    name              = "IF1"
    instance_type     = "e2-medium"
    region            = "asia-east2"
    zone              = "asia-east2-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  IF2 = {
    name              = "IF2"
    instance_type     = "e2-medium"
    region            = "asia-east2"
    zone              = "asia-east2-a"
    os_type           = "rhel-9"
    storage_size      = 30
    elastic_ip_needed = false
    security_group_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8000
        to_port     = 9999
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}
