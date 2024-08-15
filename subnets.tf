resource "oci_core_subnet" "vcn_private_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.69.69.128/25"
  display_name   = "PrivateSubnet"
  route_table_id = oci_core_route_table.route_table_private.id
  security_list_ids = [oci_core_security_list.private_security_list.id]
}

resource "oci_core_subnet" "vcn_public_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.69.69.0/25"
  display_name   = "PublicSubnet"
  route_table_id = oci_core_route_table.route_table_public.id
  security_list_ids = [oci_core_security_list.public_security_list.id]
}
