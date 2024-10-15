#!/bin/bash

# Função para verificar se um comando está disponível
checar_comando() {
    command -v "$1" >/dev/null 2>&1 # command retorna 0 se o comando for encontrado e 1 se não for.
}

# Verifica e instala o Python
if checar_comando python3; then
    echo "Python já está instalado."
else
    echo "Python não encontrado. Instalando..."
    sudo apt update
    sudo apt install -y python3 python3-pip
    echo "Python instalado."
fi

# Verifica e instala o Java 17
if checar_comando java; then
    echo "Java já está instalado."
else
    echo "Java não encontrado. Instalando Java 17..."
    sudo apt update
    sudo apt install -y openjdk-17-jdk
    echo "Java 17 instalado."
fi

# Verifica e instala o Git
if checar_comando git; then
    echo "Git já está instalado."
else
    echo "Git não encontrado. Instalando..."
    sudo apt update
    sudo apt install -y git
    echo "Git instalado."
fi

# Diretório do repositório de Python Git
REPO_DIR_PY="$HOME/ServGuard-Python"

# Verifica se o diretório do repositório PY existe
if [ -d "$REPO_DIR_PY" ]; then
    echo "Repositório encontrado. Atualizando com git pull..."
    cd "$REPO_DIR_PY" && git pull
else
    echo "Repositório não encontrado no caminho: $REPO_DIR_PY. Clonando repositório..."
    git clone https://github.com/ServGuard-org/ServGuard-Python.git "$REPO_DIR_PY"
    cd "$REPO_DIR_PY"
fi

# Verifica e executa o script Python
SCRIPT_PYTHON="$REPO_DIR_PY/setup-inicial.py"

if [ -f "$SCRIPT_PYTHON" ]; then
    echo "Executando script Python..."
    cd "$REPO_DIR_PY" 
    pip install -r requirements.txt
    python3 "$SCRIPT_PYTHON"
else
    echo "Script Python não encontrado no caminho: $SCRIPT_PYTHON."
fi

# Diretório do repositório de Kotlin Git
REPO_DIR_KT="$HOME/ServGuard-Kotlin"

# Verifica se o diretório do repositório KT existe
if [ -d "$REPO_DIR_KT" ]; then
    echo "Repositório encontrado. Atualizando com git pull..."
    cd "$REPO_DIR_KT" && git pull
else
    echo "Repositório não encontrado no caminho: $REPO_DIR_KT. Clonando repositório..."
    git clone https://github.com/ServGuard-org/ServGuard-Kotlin.git "$REPO_DIR_KT"
    cd "$REPO_DIR_KT/jars"
fi

# Verifica e executa o .jar
JAR_FILE="$REPO_DIR_KT/jars/conexao_bd-1.0-SNAPSHOT-jar-with-dependencies.jar"

if [ -f "$JAR_FILE" ]; then
    echo "Executando o arquivo .jar..."
    java -jar "$JAR_FILE"
else
    echo "Arquivo .jar não encontrado no caminho: $JAR_FILE."
fi


