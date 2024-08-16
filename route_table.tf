# Recurso para criar um Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  # OCID do compartimento onde o Internet Gateway será criado
  compartment_id = var.compartment_id

  # OCID da Virtual Cloud Network (VCN) à qual o Internet Gateway será anexado
  vcn_id = module.vcn.vcn_id

  # Nome de exibição do Internet Gateway
  display_name = "NAT_Internet_Gateway"
}

# Consulta para obter todos os serviços disponíveis na Oracle Cloud Infrastructure (OCI)
data "oci_core_services" "all_oci_services" {}

# Recurso para criar um Service Gateway
resource "oci_core_service_gateway" "service_gateway" {
  # OCID do compartimento onde o Service Gateway será criado
  compartment_id = var.compartment_id

  # OCID da Virtual Cloud Network (VCN) à qual o Service Gateway será anexado
  vcn_id = module.vcn.vcn_id

  # Nome de exibição do Service Gateway
  display_name = "NAT_Service_Gateway"

  # Lista de serviços que o Service Gateway vai acessar
  services {
    # Usar o primeiro serviço da lista se estiver disponível
    service_id = length(data.oci_core_services.all_oci_services.services) > 0 ? data.oci_core_services.all_oci_services.services[0].id : ""
  }
}

# Recurso para criar uma tabela de rotas para a rede privada
resource "oci_core_route_table" "route_table_private" {
  # OCID do compartimento onde a tabela de rotas será criada
  compartment_id = var.compartment_id

  # Nome de exibição da tabela de rotas
  display_name = "PrivateRouteTable"

  # OCID da Virtual Cloud Network (VCN) à qual a tabela de rotas será associada
  vcn_id = module.vcn.vcn_id

  # Regras de rota para a tabela de rotas privada
  route_rules {
    # Rota para acessar os serviços PaaS na rede Oracle
    network_entity_id = oci_core_service_gateway.service_gateway.id
    destination       = "all-gru-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    description       = "Rota para todos os serviços PaaS na rede Oracle"
  }

  route_rules {
    # Rota para tráfego de saída para a Internet, utilizando o IP privado obtido
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = data.oci_core_private_ips.private_ips_vnic.private_ips[0].id
  }
}

# Recurso para criar uma tabela de rotas para a rede pública
resource "oci_core_route_table" "route_table_public" {
  # OCID do compartimento onde a tabela de rotas será criada
  compartment_id = var.compartment_id

  # Nome de exibição da tabela de rotas
  display_name = "PublicRouteTable"

  # OCID da Virtual Cloud Network (VCN) à qual a tabela de rotas será associada
  vcn_id = module.vcn.vcn_id

  # Regras de rota para a tabela de rotas pública
  route_rules {
    # Rota para o Internet Gateway
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    description       = "Rota para Internet Gateway"
  }
}
