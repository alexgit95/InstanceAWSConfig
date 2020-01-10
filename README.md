# InstanceAWSConfig

## Objet

Terraform + ansible + docker

## Pre requis:

Se placer dans le repertoire Infra :

```
cd InstanceAWSConfig
```

Generer une paire de cle ssh :

https://www.hostinger.fr/tutoriels/generer-cle-ssh/

Puis les placer un repertoire ssh/ du repertoire InstanceAWSConfig

Verifier que l'on a bien ssh/id_rsa.pub et ssh/id_rsa


## Terraform :

Lancer : 

```
terraform init

terraform apply
```

## Se connecter en ssh à la machine pour installer python

```
sudo apt-get install python
```

## Installation ansible

Se placer dans le repertoire ansible

```
cd ansible
```

Modifier le fichier hosts pour avoir l'ip de la nouvelle instance

Puis lancer :

```
ansible-playbook -i ./hosts playbook.yml
```











# A revoir

## Ansible inventory 

Telecharger une release

voir https://github.com/adammck/terraform-inventory


pour lancer ansible :
 
ansible-playbook --inventory-file=/path/to/terraform-inventory ansible/playbook.yml


## test 10/01
sur la vm amazon il faut installer à la main python et pip

puis aller dans le repertoire ansible et faire 

ansible-playbook -i ./hosts playbook.yml
