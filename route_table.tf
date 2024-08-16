# Recurso para o Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  display_name   = "NAT_Internet_Gateway"
}

# Consulta para obter os serviços OCI
data "oci_core_services" "all_oci_services" {}

# Recurso para o Service Gateway
resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  display_name   = "NAT_Service_Gateway"
  services {
    # Use o primeiro serviço da lista se estiver disponível
    service_id = length(data.oci_core_services.all_oci_services.services) > 0 ? data.oci_core_services.all_oci_services.services[0].id : ""
  }
}

resource "oci_core_route_table" "route_table_private" {
  compartment_id = var.compartment_id
  display_name   = "PrivateRouteTable"
  vcn_id         = module.vcn.vcn_id
  route_rules {
    network_entity_id = oci_core_service_gateway.service_gateway.id
    destination       = "all-gru-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    description       = "Rota para todos os serviços PaaS na rede Oracle"
  }  
  route_rules {
    destination        = "0.0.0.0/0"
    destination_type   = "CIDR_BLOCK"
    network_entity_id  = data.oci_core_private_ips.private_ips_vnic.private_ips[0].id
  }
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
