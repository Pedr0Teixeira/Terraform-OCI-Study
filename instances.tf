# Criar a instância Ubuntu na Oracle Cloud Infrastructure (OCI)
resource "oci_core_instance" "ubuntu_instance" {
  # Define o domínio de disponibilidade onde a instância será criada,
  # utilizando o primeiro domínio disponível da lista obtida anteriormente.
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name

  # Especifica o OCID do compartimento onde a instância será criada.
  compartment_id = var.compartment_id

  # Define o shape da instância, que especifica os recursos de CPU e memória.
  shape = "VM.Standard.A1.Flex"

  # Configura os recursos da instância, neste caso, 1 GB de memória e 1 OCPU.
  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  # Define a imagem que será usada para criar a instância. 
  # O source_id refere-se ao OCID da imagem Ubuntu específica.
  source_details {
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacu6x6mx4f3774nwl7nsvfkr7dxusin2qsop437hcdob6pmlfrhva"
    source_type = "image"
  }

  # Define o nome de exibição da instância para fácil identificação.
  display_name = "UBUNTU-FW"

  # Configura os detalhes do VNIC (Virtual Network Interface Card) da instância.
  create_vnic_details {
    # Não atribui um IP público automaticamente.
    assign_public_ip = false

    # Define um IP privado específico para a instância.
    private_ip = "10.69.69.254"

    # Especifica o OCID da subnet onde o VNIC será criado.
    subnet_id = oci_core_subnet.vcn_public_subnet.id

    # Configuração para ignorar a verificação de origem/destino, necessário para firewalls e NAT.
    skip_source_dest_check = true
  }

  # Metadata para a instância, incluindo a chave pública SSH para acesso.
  metadata = {
    ssh_authorized_keys = file(var.path_local_public_key)
  }
}

# Obter os VNIC Attachments (anexos de VNICs) após a criação da instância
data "oci_core_vnic_attachments" "vnic_attachments" {
  # Especifica o compartimento onde os VNICs estão associados.
  compartment_id = var.compartment_id

  # Define o OCID da instância criada para obter seus VNIC Attachments.
  instance_id = oci_core_instance.ubuntu_instance.id

  # Garante que essa etapa seja executada após a criação da instância.
  depends_on = [oci_core_instance.ubuntu_instance]
}

# Obter VNICs usando os VNIC Attachments
data "oci_core_vnic" "vnics" {
  # Obtém o VNIC específico usando o ID do VNIC Attachment.
  vnic_id = data.oci_core_vnic_attachments.vnic_attachments.vnic_attachments[0].vnic_id
}

# Obter o Private IP associado ao VNIC
data "oci_core_private_ips" "private_ips_vnic" {
  # Especifica o ID do VNIC para obter o IP privado associado.
  vnic_id = data.oci_core_vnic.vnics.vnic_id
}

# Associar um IP público reservado ao Private IP da instância
resource "oci_core_public_ip" "ubuntu_instance" {
  # Define o compartimento onde o IP público será reservado.
  compartment_id = var.compartment_id

  # Nome de exibição do IP público.
  display_name = "UBUNTU-FW"

  # Define que o IP público terá uma vida útil reservada, 
  # permitindo que ele persista mesmo após a instância ser destruída.
  lifetime = "RESERVED"

  # Especifica o IP privado ao qual o IP público será associado.
  private_ip_id = data.oci_core_private_ips.private_ips_vnic.private_ips[0].id

  # Configurações do ciclo de vida para permitir que o IP público possa ser destruído, se necessário.
  lifecycle {
    prevent_destroy = false
  }
}
