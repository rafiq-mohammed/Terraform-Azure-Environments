Commands to use
- cd environments/dev/
- terraform init -backend-config="dev-backend.tfvars"
- terraform plan -var-file="dev-variables.tfvars"
- terraform apply -var-file="dev-variables.tfvars" -auto-approve