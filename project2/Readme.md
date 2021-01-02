As openstack admin
1. create project2
2. create user project2-admin with role admin on project2
3. create buckets: project2 and project2_archive


As project2-admin: 
1. create secrets: 
	a) generate keypair 
	b) cloud config - copy clouds.yaml to /root/.config/openstack/clouds.yaml
	c) rc file
2. create private network, router with external network, subnet
3. adjust default sg for packer
4. create images with packer

Terraform
1. provider.tf
2. credentials.tf
3. versions.tf
4. terraform.tf
5. main.tf - for environments
