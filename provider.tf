# Configuração do provedor OCI para Terraform
provider "oci" {
  # OCID (Oracle Cloud Identifier) do tenancy (conta) na Oracle Cloud.
  tenancy_ocid = var.tenancy_ocid

  # OCID do usuário da Oracle Cloud que está executando o Terraform.
  user_ocid = var.user_ocid

  # Caminho para o arquivo de chave privada usado para autenticação com a Oracle Cloud.
  private_key_path = var.private_key_path

  # Fingerprint da chave pública usada para autenticação.
  fingerprint = var.fingerprint

  # Região da Oracle Cloud onde os recursos serão criados. 
  region = var.region
}
