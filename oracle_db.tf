# # Resources
# resource "oci_database_db_system" "tf_db" {
#   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#   compartment_id      = var.compartment_id

#   db_home {
#     database {
#       admin_password = var.db_admin_password
#       db_name        = var.db_name
#       db_workload    = var.db_workload
#       pdb_name       = var.db_pdb_name
#     }
#     db_version = var.db_version
#   }

#   hostname                = var.db_hostname
#   shape                   = var.db_shape
#   cpu_core_count          = var.cpu_core_count
#   ssh_public_keys         = [file(var.db_public_key)]
#   subnet_id               = oci_core_subnet.vcn-private-subnet.id
#   display_name            = var.db_display_name
#   data_storage_size_in_gb = var.db_storage_gb
#   database_edition        = var.db_database_edition
#   domain                  = var.db_host_domain
#   license_model           = var.db_license_model
#   node_count              = var.db_node_count
#   private_ip              = var.db_private_ip
# }
