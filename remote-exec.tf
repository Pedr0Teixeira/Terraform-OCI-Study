# # Execute commands in Linux Instance

# resource "null_resource" "remote-exec" {

#   depends_on = [oci_core_instance.ubuntu_instance2]

#   provisioner "remote-exec" {

#     connection {

#       agent       = false

#       timeout     = "30m"

#       host        = oci_core_instance.ubuntu_instance2.public_ip

#       user        = "ubuntu"

#       private_key = file(var.path_local_private_key)

#     }

#     inline = [

#       "touch /home/ubuntu/logs",

#       "sudo apt-get update >> /home/ubuntu/logs",

#       "echo ' ' >> /home/ubuntu/logs",

#       "echo ' ' >> /home/ubuntu/logs",

#       "echo ' ' >> /home/ubuntu/logs",

#       "sudo apt-get install net-tools nmap vim telnet -y >> /home/ubuntu/logs",

#       "echo FUNCIONOU >> /home/ubuntu/logs"

#     ]

#   }

# }