#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update

# Instala dependências
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adiciona o repositório estável do Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza novamente a lista de pacotes após adicionar o repositório
sudo apt update

# Instala o Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Adiciona o usuário atual ao grupo docker para executar comandos Docker sem sudo
sudo usermod -aG docker $USER

# Instala o Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Mostra informações sobre as versões instaladas
docker --version
docker-compose --version

# Inicia o serviço do Docker
sudo systemctl start docker
sudo systemctl enable docker

echo "Docker e Docker Compose foram instalados com sucesso!"
