# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "private_security_list" {

  # Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"
  vcn_id         = module.vcn.vcn_id
  display_name   = "PrivateSecList"
  egress_security_rules {
    stateless        = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }
  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "all"
  }
}

# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "public_security_list" {

  # Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"
  vcn_id         = module.vcn.vcn_id

  # Optional
  display_name = "PublicSecList"
  egress_security_rules {
    stateless        = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }
  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol = "all"
  }
}

