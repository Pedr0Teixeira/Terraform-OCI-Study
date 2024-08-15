module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.1.0"

  # Required Inputs
  compartment_id = var.compartment_id
  region         = "sa-saopaulo-1"

  create_internet_gateway = false
  create_nat_gateway      = false
  create_service_gateway  = false

  internet_gateway_route_rules = null
  nat_gateway_route_rules = null
  # Optional Inputs
  vcn_name      = "NATVCN"
  vcn_dns_label = "NATVCN"
  vcn_cidrs     = ["10.69.69.0/24"]
}
