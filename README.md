# Practica 2 Unir

## Automatización de despliegues en entornos Cloud

Para el despliegue de kubernetes en entornos Cloud se deberan realizar los siguientes pasos:

* Intalar en maquina donde se va a lanzar la automatización Terraform y Ansible.
* Tener clave publica en la maquina donde lanzaremos el proceso.
* Clonar el repositorio Git
* Tener suscripción a Azure
* Recuerar datos de la suscripción de Azure apra la conexión con terraform
* Crear fichero credentials.tf con los datos de la suscripción. (importante que el ficehro este en el .gitignore para no subirlo al control de código fuente)
* Aceptamos los terminos de azure para la suscripción:

az vm image terms show --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810

az vm image accept-terms --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810

* Lanzar script "01-Crear_maquinas_Azure" encargado de la creación de la infrastructura en Azure mediante la utilización de Terraform.
* Lanzar script "02-Instalar_k8s.sh" que tiene tres parametros de entrada: IP del nodo master, IP del nodo worker, IP del otro nodo worker. El script despliega los 3 nodos de kubernetes en las maquinas virtuales pasadas por parametro.
* Lanzar script "03-DesplegarApp" que tiene como parametro el nodo que tiene el servidor nfs. El script despliega tres ejemplos de aplicación diferente en el clúster de kubernetes.
