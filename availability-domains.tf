# Obtém a lista de domínios de disponibilidade (Availability Domains) 
# para um determinado compartimento na Oracle Cloud Infrastructure (OCI).
# Fonte: https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains

data "oci_identity_availability_domains" "ads" {
  # OCID do compartimento (neste caso, o tenancy OCID) para o qual os domínios de disponibilidade serão listados.
  compartment_id = var.compartment_id
}
