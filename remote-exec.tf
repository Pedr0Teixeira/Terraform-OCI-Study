resource "null_resource" "transfer_and_execute_script" {
  depends_on = [oci_core_instance.ubuntu_instance]

  provisioner "file" {
    source      = "setup_fw.sh"
    destination = "/tmp/setup_fw.sh"

    connection {
      host        = oci_core_instance.ubuntu_instance.public_ip
      user        = "ubuntu"
      private_key = file(var.path_local_private_key)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup_fw.sh",
      "sudo /tmp/setup_fw.sh"
    ]

    connection {
      host        = oci_core_instance.ubuntu_instance.public_ip
      user        = "ubuntu"
      private_key = file(var.path_local_private_key)
    }
  }
}
