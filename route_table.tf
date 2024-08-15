# Recurso para o Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  display_name   = "NAT_Internet_Gateway"
}

# Consulta para obter os serviços OCI
data "oci_core_services" "all_oci_services" {}

#######

resource "oci_core_vnic_attachment" "test_vnic_attachment" {
	#Required
	create_vnic_details {
		#Required
		subnet_id = "${oci_core_subnet.vcn_public_subnet.id}"

		#Optional
		private_ip = "10.69.69.254"
	}
	instance_id = "${oci_core_instance.ubuntu_instance.id}"

	#Optional
	display_name = "UBUNTU-FW"
}

resource "oci_core_private_ip" "prod_private_ip" {
  vnic_id      = "${oci_core_vnic_attachment.test_vnic_attachment.vnic_id}"
  display_name = "prodinstanceprivateip"
}

#################

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
    network_entity_id = "${oci_core_private_ip.prod_private_ip.id}"
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
