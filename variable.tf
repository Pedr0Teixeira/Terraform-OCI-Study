# Configurações do Oracle DB
variable "compartment_id" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"
}
variable "db_admin_password" {
  type    = string
  default = "TesteccmSenha123##"
}
variable "db_name" {
  type    = string
  default = "CCM"
}
variable "db_public_key" {
  default  = "~/PEDROTEIXEIRA.pub"
  sensitive = true
}
variable "db_display_name" {
  type    = string
  default = "CCM-BANCORA-PAAS"
}
variable "db_pdb_name" {
  type    = string
  default = "PROD"
}
variable "db_hostname" {
  type    = string
  default = "CCM-BANCORA-PAAS"
}
variable "db_host_domain" { 
  type = string
  default = "oraclevcn.com"
}
variable "db_storage_gb" {
  type    = number
  default = 256
}
variable "db_workload" {
  type    = string
  default = "OLTP"
}
variable "db_version" {
  type    = string
  default = "19.24.0.0"
}
variable "db_shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}
variable "db_database_edition" {
  type    = string
  default = "STANDARD_EDITION"
}
variable "db_license_model" {
  type    = string
  default = "LICENSE_INCLUDED"
}
variable "db_node_count" {
  type    = number
  default = 1
}
variable "db_private_ip" {
  type    = string
  default = "10.69.69.25"
}
variable "cpu_core_count" {
  type    = number
  default = 1
}
variable "memory_size_gb" {
  type    = number
  default = 16
}
# Chaves Públicas e Privadas
variable "path_local_public_key" {
  type     = string
  default  = "~/PEDROTEIXEIRA.pub"
  sensitive = true
}

variable "path_local_private_key" {
  type     = string
  default  = "~/PEDROTEIXEIRA-SSH.ppk"
  sensitive = true
}

# Configurações da API do Usuário, ID Tenancy e da Região
variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa6oix7ix76xzg5uxgptk7k6jbdgnudr53tkrtrulz7tgkhv4xvw2q"
}

variable "user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaa34zz4efll3ohhj64b2374zg4augvvdaiq6oourjeht34aijkbwva"
}

variable "private_key_path" {
  type    = string
  default = "/home/pedro/.oci/pedro-rsa.pem"
}

variable "fingerprint" {
  type    = string
  default = "f5:da:f1:ff:38:d1:fa:8b:ee:51:64:d0:ca:af:04:06"
}

variable "region" {
  type    = string
  default = "sa-saopaulo-1"
}
