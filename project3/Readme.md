As openstack admin
1. run admin terraform to create: project, admin user with admin role, buckets


As project3-admin: 
1. create secrets: 
	a) generate keypair - via linux cli
	b) login to openstack panel , project > api access > download and install properly clouds.yaml to /root/.config/openstack/clouds.yaml and rc file
	c) rc file - add password here
2. create private network, router with external network, subnet
# terraform apply -target=module.stg.module.private_network
3. run packer to generate golden images
4. run terraform on all

Terraform
1. provider.tf
2. credentials.tf
3. versions.tf
4. terraform.tf
5. main.tf - for environments
