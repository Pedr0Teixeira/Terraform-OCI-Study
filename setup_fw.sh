#!/bin/bash

# Função para exibir status
status() {
  echo -e "\033[0;32m✔ $1\033[0m"
}

# Função para exibir erros
error() {
  echo -e "\033[0;31m✘ $1\033[0m"
}

# Limpeza das regras de iptables existentes
echo "Limpando regras de iptables..."
iptables -F
iptables -t nat -F
iptables -X
iptables -t nat -X
if [ $? -eq 0 ]; then
  status "Regras de iptables limpas"
else
  error "Falha ao limpar regras de iptables"
fi

# Configuração do redirecionamento de pacotes
echo "Configurando redirecionamento de pacotes..."
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
sysctl -f > /dev/null
sysctl -p > /dev/null
if [ $? -eq 0 ]; then
  status "Configuração de redirecionamento de pacotes"
else
  error "Falha na configuração de redirecionamento de pacotes"
fi

# Configuração do fuso horário
echo "Configurando fuso horário..."
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
if [ $? -eq 0 ]; then
  status "Configuração do fuso horário"
else
  error "Falha na configuração do fuso horário"
fi

# Atualização e instalação de pacotes necessários
echo "Atualizando pacotes..."
apt-get update > /dev/null 2>&1
if [ $? -eq 0 ]; then
  status "Pacotes atualizados"
else
  error "Falha ao atualizar pacotes"
fi

echo "Instalando pacotes..."
apt-get install telnet nmap vim net-tools iputils-ping -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
  status "Pacotes instalados"
else
  error "Falha ao instalar pacotes"
fi

# Aplicação das regras de iptables
echo "Aplicando regras de iptables..."
iptables -t nat -A POSTROUTING -s 10.69.69.0/25 -o enp0s6 -j MASQUERADE
iptables -I FORWARD -s 0.0.0.0/0 -d 10.69.69.0/25 -j ACCEPT
iptables -I FORWARD -j ACCEPT
iptables -t nat -I PREROUTING -p tcp --dport 2200 -j DNAT --to-destination 10.69.69.25:22
if [ $? -eq 0 ]; then
  status "Regras de iptables aplicadas"
else
  error "Falha ao aplicar regras de iptables"
fi

# Configuração do arquivo /etc/iptables/rules.v4
echo "Configurando /etc/iptables/rules.v4..."
{
  echo '*filter'
  echo ':INPUT ACCEPT [0:0]'
  echo ':FORWARD ACCEPT [0:0]'
  echo ':OUTPUT ACCEPT [0:0]'
  echo 'COMMIT'
} > /etc/iptables/rules.v4
if [ $? -eq 0 ]; then
  status "Configuração do /etc/iptables/rules.v4"
else
  error "Falha na configuração do /etc/iptables/rules.v4"
fi

# Configuração do /etc/rc.local para carregar as regras no boot
echo "Configurando /etc/rc.local..."
{
  echo '#!/bin/bash'
  echo 'iptables-restore < /etc/iptables/rules.v4'
  echo 'iptables -t nat -A POSTROUTING -s 10.69.69.0/25 -o enp0s6 -j MASQUERADE'
  echo 'iptables -I FORWARD -s 0.0.0.0/0 -d 10.69.69.0/25 -j ACCEPT'
  echo 'iptables -I FORWARD -j ACCEPT'
  echo 'exit 0'
} > /etc/rc.local
chmod u+x /etc/rc.local
if [ $? -eq 0 ]; then
  status "Configuração do /etc/rc.local"
else
  error "Falha na configuração do /etc/rc.local"
fi

# Reiniciar o serviço rc-local
echo "Habilitando e iniciando o serviço rc-local..."
systemctl daemon-reload
systemctl enable rc-local > /dev/null 2>&1
systemctl start rc-local
if [ $? -eq 0 ]; then
  status "Serviço rc-local habilitado e iniciado"
else
  error "Falha ao habilitar ou iniciar o serviço rc-local"
fi
