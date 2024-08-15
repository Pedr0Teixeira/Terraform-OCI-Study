# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains

data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaa6oix7ix76xzg5uxgptk7k6jbdgnudr53tkrtrulz7tgkhv4xvw2q"
}