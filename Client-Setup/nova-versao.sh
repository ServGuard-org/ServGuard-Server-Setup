#!/bin/bash

    sudo apt update
    sudo apt install -y python3 python3-pip
    cd "$HOME/ServGuard-Python/"
    sudo apt install python3-venv
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    sudo apt update
    sudo apt install -y openjdk-17-jdk
    echo "Java 17 instalado."
    sudo apt update
    sudo apt install -y git
    echo "Git instalado."

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

cd "$HOME/ServGuard-Python/"

sudo apt install python3.10-venv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 setup-inicial.py

# venv/bin/activate
# USAR source venv/bin/activate PARA ATIVAR O VENV PYTHON PARA RODAR O SCRIPT 
# SEMPRE QUE FOR EXECUTAR O SCRIPT PYTHON NO TERMINAL DO LINUX (BASH) 
