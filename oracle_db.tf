# Recursos para criar um sistema de banco de dados na Oracle Cloud Infrastructure (OCI)
resource "oci_database_db_system" "tf_db" {
  # Define o domínio de disponibilidade onde o sistema de banco de dados será criado,
  # utilizando o primeiro domínio disponível da lista obtida anteriormente.
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name

  # Especifica o OCID do compartimento onde o sistema de banco de dados será criado.
  compartment_id = var.compartment_id

  # Configuração do ambiente do banco de dados
  db_home {
    # Configuração do banco de dados a ser criado no ambiente
    database {
      # Senha do administrador do banco de dados. É importante usar uma senha segura.
      admin_password = var.db_admin_password

      # Nome do banco de dados.
      db_name = var.db_name

      # Tipo de carga de trabalho do banco de dados, como OLTP, DSS, etc.
      db_workload = var.db_workload

      # Nome do PDB (Pluggable Database), se aplicável.
      pdb_name = var.db_pdb_name
    }

    # Versão do banco de dados a ser instalado.
    db_version = var.db_version
  }

  # Nome do host para o sistema de banco de dados.
  hostname = var.db_hostname

  # Define o shape da instância do banco de dados, que especifica os recursos de CPU e memória.
  shape = var.db_shape

  # Número de núcleos de CPU alocados para o sistema de banco de dados.
  cpu_core_count = var.cpu_core_count

  # Chaves públicas SSH para acesso ao sistema de banco de dados.
  ssh_public_keys = [file(var.db_public_key)]

  # OCID da subnet onde o sistema de banco de dados será criado.
  subnet_id = oci_core_subnet.vcn_private_subnet.id

  # Nome de exibição do sistema de banco de dados para fácil identificação.
  display_name = var.db_display_name

  # Tamanho do armazenamento de dados em GB.
  data_storage_size_in_gb = var.db_storage_gb

  # Edição do banco de dados (Standard Edition, Enterprise Edition, etc.).
  database_edition = var.db_database_edition

  # Domínio do host para o sistema de banco de dados.
  domain = var.db_host_domain

  # Modelo de licença do banco de dados (trazido por exemplo: Licença incluída, Licença própria).
  license_model = var.db_license_model

  # Número de nós para o sistema de banco de dados (em configurações de alta disponibilidade).
  node_count = var.db_node_count

  # IP privado para a instância do banco de dados.
  private_ip = var.db_private_ip
}