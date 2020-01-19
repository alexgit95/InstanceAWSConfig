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

terraform apply -auto-approve && export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i ./hosts  ansible/playbook.yml
```
En cas de problème Unable to acquire the dpkg frontend lock, relancer uniquement :

```
export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i ./hosts  ansible/playbook.yml

```