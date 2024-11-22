#!/bin/bash

echo '========================================================================================================='
echo 'Iniciando script de automacao' 
echo '========================================================================================================='

# Atualizando sistema
sudo apt update && sudo apt upgrade -y

echo '========================================================================================================='
echo 'Iniciando alteracoes de senha'
echo '========================================================================================================='

# Alterando senha do usuário atual
echo "ubuntu:urubu100" | sudo chpasswd
echo 'root:urubu100' | sudo chpasswd

echo '========================================================================================================='
echo 'Instalando Git'
echo '========================================================================================================='

# Instalando Git
sudo apt install git -y

# Verificando versão do Git
git --version || { echo "Erro ao verificar a versão do Git"; exit 1; }

echo '========================================================================================================='
echo 'Instalando Docker'
echo '========================================================================================================='

# Instalando Docker
sudo apt install docker.io -y

# Verificando versão do Docker
docker --version || { echo "Erro ao verificar a versão do Docker"; exit 1; }

echo '========================================================================================================='
echo 'Iniciando e ativando servicos Docker'
echo '========================================================================================================='

# Iniciando e ativando Docker
sudo systemctl start docker
sudo systemctl enable docker

echo '========================================================================================================='
echo 'Adicionando usuário atual ao grupo docker'
echo '========================================================================================================='

# Adicionando usuário ao grupo docker
sudo usermod -aG docker $USER

echo '========================================================================================================='
echo 'Instalando Docker Compose'
echo '========================================================================================================='

# Baixando e instalando Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificando versão do Docker Compose
docker-compose --version || { echo "Erro ao verificar a versão do Docker Compose"; exit 1; }

echo '========================================================================================================='
echo 'Clonando repositórios do GitHub: ServGuard'
echo '========================================================================================================='

# Clonando repositórios
git clone https://github.com/ServGuard-org/ServGuard-WebSite.git
git clone https://github.com/ServGuard-org/ServGuard-Setups.git

echo '========================================================================================================='
echo 'Mudando de diretorio para ServGuard-WebSite'
echo '========================================================================================================='

# Mudando para o diretório do repositório clonado
cd /home/ubuntu/ServGuard-WebSite || { echo "Erro ao mudar de diretório"; exit 1; }

echo '========================================================================================================='
echo 'Rodando docker-compose'
echo '========================================================================================================='

# Executando docker-compose
docker-compose -f docker-compose-ee.yml up -d || { echo "Erro ao executar docker-compose"; exit 1; }

echo '========================================================================================================='
echo 'Listando as imagens'
echo '========================================================================================================='

# Listando imagens Docker
docker images

echo '========================================================================================================='
echo 'Verificando se os containers foram criados'
echo '========================================================================================================='

# Listando containers Docker
docker ps -a
