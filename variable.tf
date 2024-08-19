# Configurações do Oracle DB

# OCID do compartimento onde os recursos serão criados
variable "compartment_id" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"
}

# Senha de administrador do banco de dados Oracle. Marcar como sensível para segurança
variable "db_admin_password" {
  type    = string
  default = "TestecomSenha123##"
}

# Nome do banco de dados Oracle a ser criado
variable "db_name" {
  type    = string
  default = "PEDRO_TESTE"
}

# Caminho para a chave pública usada para acesso SSH. Marcar como sensível para segurança
variable "db_public_key" {
  default   = "~/PEDROTEIXEIRA.pub"
  sensitive = true
}

# Nome de exibição do banco de dados Oracle
variable "db_display_name" {
  type    = string
  default = "PEDRO-BANCORA-PAAS"
}

# Nome do Pluggable Database (PDB) dentro do banco de dados Oracle
variable "db_pdb_name" {
  type    = string
  default = "PROD"
}

# Nome do host para o banco de dados Oracle
variable "db_hostname" {
  type    = string
  default = "PEDRO-BANCORA-PAAS"
}

# Domínio do host para o banco de dados Oracle
variable "db_host_domain" {
  type    = string
  default = "oraclevcn.com"
}

# Tamanho do armazenamento em GB para o banco de dados Oracle
variable "db_storage_gb" {
  type    = number
  default = 256
}

# Tipo de carga de trabalho do banco de dados Oracle (ex: OLTP)
variable "db_workload" {
  type    = string
  default = "OLTP"
}

# Versão do banco de dados Oracle a ser utilizada
variable "db_version" {
  type    = string
  default = "19.24.0.0"
}

# Shape (tipo de máquina) para o banco de dados Oracle
variable "db_shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}

# Edição do banco de dados Oracle (ex: STANDARD_EDITION)
variable "db_database_edition" {
  type    = string
  default = "STANDARD_EDITION"
}

# Modelo de licença para o banco de dados Oracle (ex: BRING_YOUR_OWN_LICENSE)
variable "db_license_model" {
  type    = string
  default = "BRING_YOUR_OWN_LICENSE" # LICENSE_INCLUDED / BRING_YOUR_OWN_LICENSE
}

# Número de nós para o banco de dados Oracle (para clusters)
variable "db_node_count" {
  type    = number
  default = 1
}

# Endereço IP privado atribuído ao banco de dados Oracle
variable "db_private_ip" {
  type    = string
  default = "10.69.69.25"
}

# Número de núcleos de CPU para o banco de dados Oracle
variable "cpu_core_count" {
  type    = number
  default = 1
}

# Tamanho da memória em GB para o banco de dados Oracle
variable "memory_size_gb" {
  type    = number
  default = 16
}

# Caminho para a chave pública SSH local. Marcar como sensível para segurança
variable "path_local_public_key" {
  type      = string
  default   = "~/PEDROTEIXEIRA.pub"
  sensitive = true
}

# Caminho para a chave privada SSH local. Marcar como sensível para segurança
variable "path_local_private_key" {
  type      = string
  default   = "~/PEDROTEIXEIRA-SSH.ppk"
  sensitive = true
}

# Configurações da API do Usuário, ID Tenancy e da Região

# OCID do tenancy (tenant) no Oracle Cloud Infrastructure
variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa6oix7ix76xzg5uxgptk7k6jbdgnudr53tkrtrulz7tgkhv4xvw2q"
}

# OCID do usuário (user) na Oracle Cloud Infrastructure
variable "user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaa34zz4efll3ohhj64b2374zg4augvvdaiq6oourjeht34aijkbwva"
}

# Caminho para a chave privada usada para autenticação na API do OCI
variable "private_key_path" {
  type    = string
  default = "/home/pedro/.oci/pedro-rsa.pem"
}

# Impressão digital da chave privada para autenticação na API do OCI
variable "fingerprint" {
  type    = string
  default = "f5:da:f1:ff:38:d1:fa:8b:ee:51:64:d0:ca:af:04:06"
}

# Região onde os recursos serão criados no Oracle Cloud Infrastructure
variable "region" {
  type    = string
  default = "sa-saopaulo-1"
}
