#!/bin/bash

# Função para verificar se um comando está disponível
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Verifica e instala o Python
if check_command python3; then
    echo "Python já está instalado."
else
    echo "Python não encontrado. Instalando..."
    sudo apt update
    sudo apt install -y python3 python3-pip
    echo "Python instalado."
fi

# Verifica e instala o Java 17
if check_command java; then
    echo "Java já está instalado."
else
    echo "Java não encontrado. Instalando Java 17..."
    sudo apt update
    sudo apt install -y openjdk-17-jdk
    echo "Java 17 instalado."
fi
