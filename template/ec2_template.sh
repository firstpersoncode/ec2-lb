#!/bin/bash
# shellcheck disable=SC2164
cd /home/ubuntu
yes | sudo apt update

#Install docker
sudo apt install docker.io -y
sleep 20
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker version
sudo systemctl start docker
sudo systemctl enable docker
# Run sonarqube
docker run -d --name sonar -p 80:9000 sonarqube:lts-community
# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 20
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install Trivy
# sudo apt-get install wget apt-transport-https gnupg lsb-release -y
# wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
# echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
# sudo apt-get update
# sudo apt-get install trivy -y

# Install Terraform
# sudo apt install wget -y
# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update && sudo apt install terraform

# Install kubectl
# sudo apt update
# sudo apt install curl -y
# curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# kubectl version --client

# Install AWS CLI 
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# sudo apt-get install unzip -y
# unzip awscliv2.zip
# sudo ./aws/install

# Install nodejs
# sudo apt install nodejs -y
# sudo apt install npm -y
# sleep 20
# node -v
# npm -v
# sudo apt update
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# sleep 20
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# nvm --version
# nvm install --lts
# nvm use --lts
# node -v


# # Install Ollama
# curl -fsSL https://ollama.com/install.sh | sh
# ollama --version

# Instal postgres
# sudo apt install postgresql

# git clone https://github.com/firstpersoncode/app-infra.git
# sleep 20
# shellcheck disable=SC2164
# cd app-infra
# npm install
# npm run build
# npm run start
# sleep 30