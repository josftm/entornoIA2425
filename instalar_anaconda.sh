#!/bin/bash

# Actualizar la lista de paquetes e instalar los necesarios
sudo apt-get update
sudo apt-get install openssh-server -y
sudo apt-get install net-tools -y

# Descargar e instalar Anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
bash Anaconda3-2024.10-1-Linux-x86_64.sh -b -p $HOME/anaconda3

echo "export PATH=$PATH:/home/eps/anaconda3/bin" >> ~/.bashrc 
source ~/.bashrc

# Configurar PATH temporalmente para que funcione en el mismo script
export PATH="$HOME/anaconda3/bin:$PATH"

# Inicializar conda en el script
eval "$($HOME/anaconda3/bin/conda shell.bash hook)"

# Crear el entorno Conda
conda init
conda env create --name entornoIA2425 --file=entornoIA2425_MAC.yml

# Activar el entorno
conda activate entornoIA2425

# Configurar Jupyter Notebook
mkdir -p /home/eps/.jupyter
echo "c.NotebookApp.notebook_dir = '/home/eps'" > /home/eps/.jupyter/jupyter_notebook_config.py

# Instalar anaconda-navigator
conda install anaconda-navigator -y

echo "Instalación completada. Puedes empezar a usar el entorno conda 'entornoIA2425'."
