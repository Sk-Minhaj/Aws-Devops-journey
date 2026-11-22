#!/bin/bash
set -e
# Step 1: go to terraform folder and create an Ec2 instance 
cd /mnt/c/Users/minha/awsdevops/aws-devops-journey/day13-project/terraform
terraform.exe init
terraform.exe apply -auto-approve

# Step 2: acquire the public IP of the EC2 instance created by Terraform
IP=$(terraform.exe output -raw public_ip | tr -d '\r')
echo "IP: $IP"

# Step 3: wait for the instance to be ready
sleep 60

# Step 4: create an inventory file for Ansible with the public IP of the EC2 instance
cd /mnt/c/Users/minha/awsdevops/aws-devops-journey/day13-project/ansible
echo "[web]" > inventory.ini
echo "$IP ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/devops-key.pem" >> inventory.ini

# Step 5: run the Ansible playbook
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini playbook.yml