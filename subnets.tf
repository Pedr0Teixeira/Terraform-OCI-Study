# Recurso para criar uma sub-rede privada
resource "oci_core_subnet" "vcn_private_subnet" {
  # ID do compartimento onde a sub-rede será criada
  compartment_id = var.compartment_id

  # OCID da Virtual Cloud Network (VCN) à qual a sub-rede será associada
  vcn_id = module.vcn.vcn_id

  # Bloco CIDR atribuído à sub-rede privada
  cidr_block = "10.69.69.0/25"

  # Nome de exibição da sub-rede privada
  display_name = "PrivateSubnet"

  # ID da tabela de rotas associada à sub-rede privada
  route_table_id = oci_core_route_table.route_table_private.id

  # IDs das listas de segurança associadas à sub-rede privada
  security_list_ids = [oci_core_security_list.private_security_list.id]
}

# Recurso para criar uma sub-rede pública
resource "oci_core_subnet" "vcn_public_subnet" {
  # ID do compartimento onde a sub-rede será criada
  compartment_id = var.compartment_id

  # OCID da Virtual Cloud Network (VCN) à qual a sub-rede será associada
  vcn_id = module.vcn.vcn_id

  # Bloco CIDR atribuído à sub-rede pública
  cidr_block = "10.69.69.128/25"

  # Nome de exibição da sub-rede pública
  display_name = "PublicSubnet"

  # ID da tabela de rotas associada à sub-rede pública
  route_table_id = oci_core_route_table.route_table_public.id

  # IDs das listas de segurança associadas à sub-rede pública
  security_list_ids = [oci_core_security_list.public_security_list.id]
}