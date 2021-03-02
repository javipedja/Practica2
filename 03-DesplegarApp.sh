#!/bin/bash

rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'

if [[ $1 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
    echo 'IP del master '$1;
else
    echo 'Error tienes que meter una IP válida para el nodo master';
    exit 1
fi


cd ansible_k8s
sed -i "s/master.azure/$1/" app/nfs-pv.yaml
ansible-playbook -i hosts app.yaml                                                                                             