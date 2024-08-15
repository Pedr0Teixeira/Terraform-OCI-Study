resource "oci_core_internet_gateway" "internet_gateway" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    display_name = "NAT_Internet_Gateway"
}

resource "oci_core_route_table" "route_table_private" {
  compartment_id = var.compartment_id
  display_name   = "PrivateRouteTable"
  vcn_id         = module.vcn.vcn_id
}

resource "oci_core_route_table" "route_table_public" {
  compartment_id = var.compartment_id
  display_name   = "PublicRouteTable"
  vcn_id         = module.vcn.vcn_id
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination = "0.0.0.0/0"
    description = "Rota para Internet Gateway"
  }
}

