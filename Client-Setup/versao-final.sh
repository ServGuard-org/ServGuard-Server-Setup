#!/bin/bash

# Executar usando
# source versao-final.sh
# ^^^^^^^^^^^^^^^^^^^^^^

# Python
    sudo apt update
    sudo apt install -y python3 python3-pip
    sudo apt install python3-venv -y
    python3 -m venv venv
    source venv/bin/activate
    git clone https://github.com/ServGuard-org/ServGuard-Python.git
    cd "$HOME/ServGuard-Python"
    pip install -r requirements.txt
    echo "URL_SLACK="COLOCAR A URL DO SLACK AQUI -------------------------"
    DB_USER="root"
    DB_PASSWORD="urubu100"
    DATABASE="ServGuard"
    HOST="COLOCAR O IP PÚBLICO DA AWS AQUI --------------------"
    PROD="s"
    ID_EMPRESA=1
    " > .env

# Kotlin
    cd "$HOME"
    sudo apt install -y openjdk-17-jdk
    git clone https://github.com/ServGuard-org/ServGuard-Jars.git
