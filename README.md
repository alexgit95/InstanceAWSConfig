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

```
ssh-keygen -t rsa -f ssh/id_rsa
```

Verifier que l'on a bien ssh/id_rsa.pub et ssh/id_rsa


## Terraform :

Lancer : 

```
terraform init

terraform apply
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


# TODO

Lancer la creation de l'instance via terraform avec l'image ubuntu

se connecter en ssh à la machine et installer python

se deconnecter

Creer une ami

Une fois l'ami cree, detruire l'instance en cours

modifier terraform pour prendre l'id de la nouvelle ami

et relancer tout le processus terraform/ansible








# A revoir

## Ansible inventory 

Telecharger une release

voir https://github.com/adammck/terraform-inventory


pour lancer ansible avec le dynamic inventory :
 
ansible-playbook --inventory-file=/path/to/terraform-inventory ansible/playbook.yml

