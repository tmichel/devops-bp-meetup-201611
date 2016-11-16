packer:
	packer build -var-file variables.json nginx.json

docker_run:
	docker run -d -p 8080:80 --name nginx meetup/devops:201611 nginx -g 'daemon off; master_process on;'
	open http://$$(docker-machine ip dev):8080

docker_stop:
	docker stop nginx
	docker rm nginx

aws:
	terraform plan -var-file variables.tfvars -out nginx.plan
	@read -p "Press ENTER to continue"
	terraform apply nginx.plan
	rm nginx.plan

destroy_aws:
	terraform destroy -var-file variables.tfvars
	rm terraform.tfstate
	rm terraform.tfstate.backup
