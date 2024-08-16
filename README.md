# Terraform-OCI-Study

Este repositório contém scripts Terraform para configurar e gerenciar recursos na Oracle Cloud Infrastructure (OCI). O objetivo é fornecer uma base sólida para a criação e gerenciamento de infraestrutura utilizando o Terraform.

## Estrutura do Projeto

O projeto é dividido em vários arquivos Terraform que configuram diferentes aspectos da infraestrutura. Abaixo está uma visão geral dos arquivos e seus propósitos:

- **`provider.tf`**: Configura o provedor OCI.
- **`vcn.tf`**: Configuração da Virtual Cloud Network (VCN) e seus componentes associados.
- **`subnets.tf`**: Define as sub-redes privadas e públicas.
- **`route_table.tf`**: Configura as tabelas de rotas para as sub-redes.
- **`security_list.tf`**: Define as listas de segurança para as sub-redes.
- **`instances.tf`**: Configura as instâncias de compute.
- **`oracle_db.tf`**: Configura o sistema de banco de dados Oracle.
- **`remote-exec.tf`**: Configura o provisionamento remoto para executar scripts na instância Ubuntu.
- **`variable.tf`**: Declara as variáveis utilizadas no projeto.

## Pré-requisitos

1. **Terraform**: Certifique-se de que o Terraform está instalado e configurado em seu ambiente. Você pode baixá-lo em [terraform.io](https://www.terraform.io/downloads.html).

2. **Credenciais OCI**: Você precisará de um perfil OCI configurado com as credenciais apropriadas. Isso inclui o OCID do tenancy, OCID do usuário, caminho da chave privada, e outros detalhes.

## Configuração

### Variáveis

No arquivo `variable.tf`, você encontrará as variáveis necessárias para configurar a infraestrutura. Ajuste os valores conforme necessário para seu ambiente. As principais variáveis incluem:

- **`compartment_id`**: OCID do compartimento onde os recursos serão criados.
- **`db_admin_password`**: Senha do administrador do banco de dados Oracle.
- **`db_public_key`**: Caminho para a chave pública utilizada para autenticação.
- **`db_hostname`**: Nome do host para o sistema de banco de dados Oracle.
- **`path_local_private_key`**: Caminho para a chave privada utilizada para autenticação SSH.

### Configuração do Provedor

No arquivo `provider.tf`, configure o provedor OCI com as variáveis apropriadas para definir as credenciais e a região. Certifique-se de atualizar os valores para corresponder à sua conta OCI.

### Configuração da VCN

No arquivo `vcn.tf`, você define a Virtual Cloud Network (VCN) e seus componentes associados, como gateways de Internet e Service Gateway, se necessário.

### Configuração das Sub-redes

O arquivo `subnets.tf` define as sub-redes privadas e públicas associadas à VCN. Verifique se as sub-redes estão corretamente configuradas para sua rede.

### Configuração das Tabelas de Rotas

No arquivo `route_table.tf`, configure as tabelas de rotas para as sub-redes, especificando as rotas para os gateways e outros destinos.

### Configuração das Listas de Segurança

O arquivo `security_list.tf` define as listas de segurança para controlar o tráfego de entrada e saída nas sub-redes. Ajuste as regras conforme necessário para suas necessidades de segurança.

### Configuração das Instâncias

No arquivo `instances.tf`, configure as instâncias de compute, incluindo detalhes como a imagem do sistema, shape, e configurações de rede.

### Configuração do Banco de Dados Oracle

O arquivo `oracle_db.tf` configura o sistema de banco de dados Oracle, incluindo detalhes como a versão, armazenamento e configuração de rede.

### Provisionamento Remoto

No arquivo `remote-exec.tf`, configure o provisionamento remoto para executar scripts na instância Ubuntu. Certifique-se de que os caminhos das chaves e os comandos estejam corretos.

## Uso

1. **Inicialize o Terraform**:
   ```bash
   terraform init

2. **Revise o plano de execução**:
   ```bash
   terraform plan

3. **Aplique a configuração**:
   ```bash
   terraform apply

4. **Destrua a infraestrutura (se necessário)**:
   ```bash
   terraform destroy

## Notas Importantes

- **Segurança**: Certifique-se de que suas chaves privadas e outras informações sensíveis não sejam expostas ou comprometidas. Utilize ferramentas de gerenciamento de segredos e controle de acesso apropriados.

- **Variáveis Sensíveis**: As variáveis como senhas e chaves privadas devem ser gerenciadas com cuidado e nunca devem ser compartilhadas publicamente.

- **Documentação do Terraform**: Para mais detalhes sobre o uso do Terraform com OCI, consulte a [documentação oficial do Terraform](https://registry.terraform.io/providers/oracle/oci/latest/docs).
