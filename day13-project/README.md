# Terraform + Ansible: Nginx on EC2

Terraform creates an EC2 instance and a security group on AWS. Ansible then installs and configures Nginx on that instance using the IP from Terraform's output.

## Folder structure

```
day13-project/
├── terraform/   # EC2 + security group (main.tf, variables.tf, outputs.tf, SecurityGroup.tf)
├── ansible/     # playbook.yml, index.html, inventory.example.ini
└── .gitignore
```

## How to run

1. Create the infrastructure:
   ```
   cd terraform
   terraform init
   terraform apply
   terraform output public_ip
   ```
2. Copy `ansible/inventory.example.ini` to `inventory.ini`, then put the EC2 IP and your key path in it.
3. Configure Nginx:
   ```
   cd ../ansible
   ansible-playbook -i inventory.ini playbook.yml
   ```
4. Open `http://<EC2_IP>` in the browser.
5. Clean up:
   ```
   cd ../terraform
   terraform destroy
   ```

## Notes

- AMI is Amazon Linux 2023, so the playbook uses `dnf`.
- Key pairs, state files and the real `inventory.ini` are not committed.