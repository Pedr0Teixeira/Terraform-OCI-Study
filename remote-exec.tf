# Recurso nulo para transferir e executar um script em uma instância de Ubuntu
resource "null_resource" "transfer_and_execute_script" {
  # Define que este recurso depende da criação da instância e do IP público
  depends_on = [
    oci_core_instance.ubuntu_instance,
    oci_core_public_ip.ubuntu_instance
  ]

  # Provisionador para transferir o script para a instância
  provisioner "file" {
    # Caminho do script local que será transferido
    source = "setup_fw.sh"

    # Caminho no qual o script será armazenado na instância remota
    destination = "/tmp/setup_fw.sh"

    # Configuração da conexão para a instância
    connection {
      # Endereço IP público da instância onde o script será transferido
      host = oci_core_public_ip.ubuntu_instance.ip_address

      # Nome do usuário para conexão SSH
      user = "ubuntu"

      # Caminho para a chave privada usada para autenticação SSH
      private_key = file(var.path_local_private_key)
    }
  }

  # Provisionador para executar o script na instância
  provisioner "remote-exec" {
    # Comandos a serem executados remotamente
    inline = [
      # Torna o script executável
      "chmod +x /tmp/setup_fw.sh",

      # Executa o script com permissões de superusuário
      "sudo /tmp/setup_fw.sh"
    ]

    # Configuração da conexão para a instância
    connection {
      # Endereço IP público da instância para execução dos comandos
      host = oci_core_public_ip.ubuntu_instance.ip_address

      # Nome do usuário para conexão SSH
      user = "ubuntu"

      # Caminho para a chave privada usada para autenticação SSH
      private_key = file(var.path_local_private_key)
    }
  }
}
