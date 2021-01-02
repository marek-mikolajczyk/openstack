Usage

SIMPLE METHOD

1. choose distro of target AMI OS -  depending on choosen distro, use ubuntu.json or centos.json
2. put credentials into json file
3. all configuration happens with provisioner - packer.yml
4. packer.yml is ansible playbook to include roles from ../ansible/roles directory


ADVANCED METHOD

1. to use extra variables for ansible roles, choose ex. centos_custom_vars.json
2. the difference is a line for provisioner:
      "extra_arguments": [ "--extra-vars", "@packer.vars" ]
3. there, you must pud variables with your values in the same way, as they are put in ../ansible/roles/<role>/vars/
