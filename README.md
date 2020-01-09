# InstanceAWSConfig

Terraform + ansible


## Terraform :

Lancer : 

terraform init

terraform deploy

## Ansible inventory 

Telecharger une release

voir https://github.com/adammck/terraform-inventory


pour lancer ansible :
 
ansible-playbook --inventory-file=/path/to/terraform-inventory ansible/playbook.yml


## test 10/01
sur la vm amazon il faut installer à la main python et pip

puis aller dans le repertoire ansible et faire 

ansible-playbook -i ./hosts playbook.yml
