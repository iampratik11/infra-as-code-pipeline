environment = "production"
aws_region  = "us-east-2"

vpc_cidr = "10.2.0.0/16"

availability_zones = [
  "us-east-2a",
  "us-east-2b"
]

public_subnet_cidrs = [
  "10.2.1.0/24",
  "10.2.2.0/24"
]

private_subnet_cidrs = [
  "10.2.11.0/24",
  "10.2.12.0/24"
]
