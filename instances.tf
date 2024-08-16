# Criar a instância
resource "oci_core_instance" "ubuntu_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.A1.Flex"
  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }
  source_details {
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaacu6x6mx4f3774nwl7nsvfkr7dxusin2qsop437hcdob6pmlfrhva"
    source_type = "image"
  }
  display_name = "UBUNTU-FW"
  create_vnic_details {
    assign_public_ip = false
    private_ip       = "10.69.69.254"
    subnet_id        = oci_core_subnet.vcn_public_subnet.id
    skip_source_dest_check = true
  }
  metadata = {
    ssh_authorized_keys = file(var.path_local_public_key)
  }
}

# Obter os VNIC Attachments após a criação da instância
data "oci_core_vnic_attachments" "vnic_attachments" {
  compartment_id = var.compartment_id
  instance_id    = oci_core_instance.ubuntu_instance.id
  depends_on     = [oci_core_instance.ubuntu_instance]
}

# Obter VNICs usando os VNIC Attachments
data "oci_core_vnic" "vnics" {
  vnic_id = data.oci_core_vnic_attachments.vnic_attachments.vnic_attachments[0].vnic_id
}

# Obter o Private IP
data "oci_core_private_ips" "private_ips_vnic" {
  vnic_id = data.oci_core_vnic.vnics.vnic_id
}

# Associar o IP público ao Private IP
resource "oci_core_public_ip" "ubuntu_instance" {
  compartment_id = var.compartment_id
  display_name   = "UBUNTU-FW"
  lifetime       = "RESERVED"
  private_ip_id  = data.oci_core_private_ips.private_ips_vnic.private_ips[0].id
  lifecycle {
    prevent_destroy = false
  }
}