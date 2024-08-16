# Fonte: https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

# Recurso para criar uma lista de segurança para a rede privada
resource "oci_core_security_list" "private_security_list" {

  # ID do compartimento onde a lista de segurança será criada
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"

  # OCID da Virtual Cloud Network (VCN) à qual a lista de segurança será associada
  vcn_id = module.vcn.vcn_id

  # Nome de exibição da lista de segurança
  display_name = "PrivateSecList"

  # Regras de segurança para egressos (tráfego de saída)
  egress_security_rules {
    # Define a regra como stateful (mantenha o estado da conexão)
    stateless = false

    # Endereço de destino para o tráfego de saída
    destination = "0.0.0.0/0"

    # Tipo de destino é um bloco CIDR
    destination_type = "CIDR_BLOCK"

    # Protocolo para a regra (todos os protocolos permitidos)
    protocol = "all"
  }

  # Regras de segurança para ingressos (tráfego de entrada)
  ingress_security_rules {
    # Define a regra como stateful (mantenha o estado da conexão)
    stateless = false

    # Fonte para o tráfego de entrada
    source = "0.0.0.0/0"

    # Tipo de fonte é um bloco CIDR
    source_type = "CIDR_BLOCK"

    # Protocolo para a regra (todos os protocolos permitidos)
    protocol = "all"
  }
}

# Fonte: https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

# Recurso para criar uma lista de segurança para a rede pública
resource "oci_core_security_list" "public_security_list" {

  # ID do compartimento onde a lista de segurança será criada
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"

  # OCID da Virtual Cloud Network (VCN) à qual a lista de segurança será associada
  vcn_id = module.vcn.vcn_id

  # Nome de exibição da lista de segurança
  display_name = "PublicSecList"

  # Regras de segurança para egressos (tráfego de saída)
  egress_security_rules {
    # Define a regra como stateful (mantenha o estado da conexão)
    stateless = false

    # Endereço de destino para o tráfego de saída
    destination = "0.0.0.0/0"

    # Tipo de destino é um bloco CIDR
    destination_type = "CIDR_BLOCK"

    # Protocolo para a regra (todos os protocolos permitidos)
    protocol = "all"
  }

  # Regras de segurança para ingressos (tráfego de entrada)
  ingress_security_rules {
    # Define a regra como stateful (mantenha o estado da conexão)
    stateless = false

    # Fonte para o tráfego de entrada
    source = "0.0.0.0/0"

    # Tipo de fonte é um bloco CIDR
    source_type = "CIDR_BLOCK"

    # Protocolo para a regra (todos os protocolos permitidos)
    protocol = "all"
  }
}