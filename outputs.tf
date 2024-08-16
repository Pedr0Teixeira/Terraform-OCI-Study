# Saída para o ID do Internet Gateway criado.
output "internet_gateway_id" {
  description = "ID do Internet Gateway criado."
  value       = oci_core_internet_gateway.internet_gateway.id
}

# Nome do primeiro domínio de disponibilidade usado para a instância de computação.
output "name-of-first-availability-domain" {
  description = "Nome do primeiro domínio de disponibilidade obtido para a instância de computação."
  value       = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# Nome de exibição da instância criada.
output "instance-name" {
  description = "Nome de exibição da instância criada."
  value       = oci_core_instance.ubuntu_instance.display_name
}

# OCID (Oracle Cloud Identifier) da instância criada.
output "instance-OCID" {
  description = "OCID da instância criada."
  value       = oci_core_instance.ubuntu_instance.id
}

# Região onde a instância está localizada.
output "instance-region" {
  description = "Região onde a instância está localizada."
  value       = oci_core_instance.ubuntu_instance.region
}

# Shape da instância, que inclui a configuração de CPU e memória.
output "instance-shape" {
  description = "Shape da instância, que especifica a configuração de CPU e memória."
  value       = oci_core_instance.ubuntu_instance.shape
}

# Estado atual da instância (por exemplo, RUNNING, STOPPED).
output "instance-state" {
  description = "Estado atual da instância (por exemplo, RUNNING, STOPPED)."
  value       = oci_core_instance.ubuntu_instance.state
}

# Número de OCPUs configurados para a instância.
output "instance-OCPUs" {
  description = "Número de OCPUs configurados para a instância."
  value       = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
}

# Quantidade de memória (em GBs) configurada para a instância.
output "instance-memory-in-GBs" {
  description = "Quantidade de memória (em GBs) configurada para a instância."
  value       = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
}

# IP privado atribuído à instância.
output "private-ip" {
  description = "IP privado atribuído à instância."
  value       = oci_core_instance.ubuntu_instance.private_ip
}

# Hora em que a instância foi criada.
output "time-created" {
  description = "Hora em que a instância foi criada."
  value       = oci_core_instance.ubuntu_instance.time_created
}

### Saídas para o sistema de banco de dados Oracle

# ID do sistema de banco de dados criado.
output "db_system_id" {
  description = "ID do sistema de banco de dados criado."
  value       = oci_database_db_system.tf_db.id
}

# Nome do host do sistema de banco de dados.
output "db_system_hostname" {
  description = "Nome do host do sistema de banco de dados."
  value       = oci_database_db_system.tf_db.hostname
}

# Shape do sistema de banco de dados, que inclui a configuração de CPU e memória.
output "db_system_shape" {
  description = "Shape do sistema de banco de dados, que especifica a configuração de CPU e memória."
  value       = oci_database_db_system.tf_db.shape
}

# Nome de exibição do sistema de banco de dados.
output "db_system_display_name" {
  description = "Nome de exibição do sistema de banco de dados."
  value       = oci_database_db_system.tf_db.display_name
}

# Tamanho do armazenamento de dados do sistema de banco de dados, em GBs.
output "db_system_data_storage_size" {
  description = "Tamanho do armazenamento de dados do sistema de banco de dados, em GBs."
  value       = oci_database_db_system.tf_db.data_storage_size_in_gb
}

# OCID da subnet onde o sistema de banco de dados está localizado.
output "db_system_subnet_id" {
  description = "OCID da subnet onde o sistema de banco de dados está localizado."
  value       = oci_database_db_system.tf_db.subnet_id
}

# Modelo de licença do sistema de banco de dados (por exemplo, Licença incluída ou Licença própria).
output "db_system_license_model" {
  description = "Modelo de licença do sistema de banco de dados (por exemplo, Licença incluída ou Licença própria)."
  value       = oci_database_db_system.tf_db.license_model
}
