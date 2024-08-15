resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaogn7mqtuiliwcw3334hfzzzjnzcsx6f5vd7sghpipnnsglzqu4ca"
    shape = "VM.Standard.A1.Flex"
    shape_config {
        memory_in_gbs = 1
        ocpus = 1
    }
    source_details {
        source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacu6x6mx4f3774nwl7nsvfkr7dxusin2qsop437hcdob6pmlfrhva"
        source_type = "image"
    }

    # Optional
    display_name = "UBUNTU-TERRAFORM"
    create_vnic_details {
        assign_public_ip = true
        private_ip = "10.69.69.254"
        subnet_id = oci_core_subnet.vcn_public_subnet.id
    }
    metadata = {
        ssh_authorized_keys = file(var.path_local_public_key)
    } 
    preserve_boot_volume = false
}