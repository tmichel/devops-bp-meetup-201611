packer:
	packer build -var-file variables.json band_gen.json

aws:
	terraform plan -var-file variables.tfvars -out band_gen.plan
	@read -p "Press ENTER to continue"
	terraform apply band_gen.plan
	rm band_gen.plan

destroy_aws:
	terraform destroy -var-file variables.tfvars
	rm terraform.tfstate
	rm terraform.tfstate.backup
