credentials_file = "gcp-key.json"
project_id       = "disco-bridge-462008-v7"
subnetwork       = "default"
splunk_license_url = "https://drive.google.com/uc?id=1ixHHHA1iqWVJda943GHYotNCpWp757Ej&export=download"
ssh_user       = "kaliy"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWfpsOpWxmcVSzbUnvIYIpdKak77zEclSqpiJW5eKkW3NWRbwJOS4XZPgtux8xFXgxZ4h354S/qEQGRukY+AClIkvyeUwwDIosUq/dTWUgIRgVQG0lixyt2lyKekRcxIRPIFtcSDnlKx1HEHSGuDSv4hHfvbxBYsBO5vdan6wDAQ5GpsgPXIHP/605DZRupRwIToJilbtUjB1/7fIkJRBFIA84rMmRviLrPL7zVDHao3KwndWU47eRRlZ+aPYJFzcdOvUPHA/4XDcR8Tbbci8LB3Xr9/fVqpEwNyADOGrQvgy+CZ5Sp1IJyGFyerUqIuVOo8qePuZUhWM3tFdeLEqnUrSu1cyu1T+0v8DmcatMNsRI52rXXlahEKDqoGal0MLFut2QbWAHszh8bQ4o9t04YvM/VdV58E23/oJTFvKRmPMUa2eiTzMOr8OvxJG7PWkVVZNEG87Mc3HzrcTU/J57Xqc1sbZgLZppCKJewB5CN3F2RgRwuFSrRtkyptywuA8= kaliy@Kaliyappan"


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
