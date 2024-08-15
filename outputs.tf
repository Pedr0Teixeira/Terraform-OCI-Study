# Outputs for compartment

output "compartment-name" {
  value = oci_identity_compartment.tf-compartment.name
}

output "compartment-OCID" {
  value = oci_identity_compartment.tf-compartment.id
}

output "internet_gateway_id" {
  description = "ID do Internet Gateway criado"
  value       = oci_core_internet_gateway.internet_gateway.id
}

# The "name" of the availability domain to be used for the compute instance.
output "name-of-first-availability-domain" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# output "instance-name" {
#   value = oci_core_instance.ubuntu_instance.display_name
# }

# output "instance-OCID" {
#   value = oci_core_instance.ubuntu_instance.id
# }

# output "instance-region" {
#   value = oci_core_instance.ubuntu_instance.region
# }

# output "instance-shape" {
#   value = oci_core_instance.ubuntu_instance.shape
# }

# output "instance-state" {
#   value = oci_core_instance.ubuntu_instance.state
# }

# output "instance-OCPUs" {
#   value = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
# }

# output "instance-memory-in-GBs" {
#   value = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
# }

# output "private-ip" {
#   value = oci_core_instance.ubuntu_instance.private_ip
# }

# output "time-created" {
#   value = oci_core_instance.ubuntu_instance.time_created
# }

# # #### Outputs DB Oracle
# # output "db_system_id" {
# #   value = oci_database_db_system.tf_db.id
# # }

# # output "db_system_hostname" {
# #   value = oci_database_db_system.tf_db.hostname
# # }

# # output "db_system_shape" {
# #   value = oci_database_db_system.tf_db.shape
# # }

# # output "db_system_display_name" {
# #   value = oci_database_db_system.tf_db.display_name
# # }

# # output "db_system_data_storage_size" {
# #   value = oci_database_db_system.tf_db.data_storage_size_in_gb
# # }

# # output "db_system_subnet_id" {
# #   value = oci_database_db_system.tf_db.subnet_id
# # }

# # output "db_system_license_model" {
# #   value = oci_database_db_system.tf_db.license_model
# # }