#!/bin/bash
rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'

if [[ $1 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
    echo 'IP del master '$1;
else
    echo 'Error tienes que meter una IP válida para el nodo master';
    exit 1
fi

if [[ $2 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
    echo 'IP del worker '$2;
else
    echo 'Error tienes que meter una IP válida para el nodo worker';
    exit 1
fi

echo 'Entramos en las VM para que no pida confirmación a Ansible'
ssh -o StrictHostKeyChecking=no adminUsername@$1 'echo "soy el master && "exit'

ssh -o StrictHostKeyChecking=no adminUsername@$2 'echo "soy el worker && "exit' 

echo 'Configuramos los hosts para el inventario'
cd ansible_k8s
sed -i "s/master.azure/$1/" hosts
sed -i "s/worker.azure/$2/" hosts

echo 'Lanzamos instalación con ansible de kubernetes'
ansible-playbook -i hosts kubernetes.yaml                                                                                             