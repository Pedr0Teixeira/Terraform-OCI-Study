module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.1.0"

  # ID do compartimento onde o VCN será criado
  compartment_id = var.compartment_id

  # Região onde o VCN será criado
  region = "sa-saopaulo-1"

  # Configurações de gateways
  # Não criar Internet Gateway para este VCN
  create_internet_gateway = false

  # Não criar NAT Gateway para este VCN
  create_nat_gateway = false

  # Não criar Service Gateway para este VCN
  create_service_gateway = false

  # Regras de roteamento para o Internet Gateway (não serão usadas porque o Internet Gateway está desativado)
  internet_gateway_route_rules = null

  # Regras de roteamento para o NAT Gateway (não serão usadas porque o NAT Gateway está desativado)
  nat_gateway_route_rules = null

  # Optional Inputs
  # Nome do VCN
  vcn_name = "NATVCN"

  # Rótulo DNS do VCN (usado para resolução de DNS no VCN)
  vcn_dns_label = "NATVCN"

  # Blocos CIDR atribuídos ao VCN
  vcn_cidrs = ["10.69.69.0/24"]
}