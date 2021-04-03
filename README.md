# Practica 2 Unir

## Automatización de despliegues en entornos Cloud

Para el despliegue de kubernetes en entornos Cloud se deberan realizar los siguientes pasos:

* Intalar en maquina donde se va a lanzar la automatización Azure CLI, Terraform y Ansible.
* Tener clave publica en la maquina donde lanzaremos el proceso.
* Clonar el repositorio Git
* Tener suscripción a Azure
* Recuerar datos de la suscripción de Azure apra la conexión con terraform
* Crear fichero credentials.tf con los datos de la suscripción. (importante que el ficehro este en el .gitignore para no subirlo al control de código fuente)

```yaml
provider "azurerm" {
  features {}
  subscription_id = "97c6977a-e7b8-42cd-9e2d-bec4eb73b994r5te2222123ed"
  client_id       = "c49e59f7-628a-4537-89cc-5e2e1a52126722222" # appID
  client_secret   = "GU2KaJYR2-Wr2D2GQcm7Las8hkH4vG324324"   # password
  tenant_id       = "f8389572-8716-463a-b0ad-8e694324324324ersdgra1e9119" # tenant
}

```
* Aceptamos los terminos de azure para la suscripción:
```yaml
az vm image terms show --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810

az vm image accept-terms --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810
```

* Lanzar script "01-Crear_maquinas_Azure" encargado de la creación de la infrastructura en Azure mediante la utilización de Terraform.
* Lanzar script "02-Instalar_k8s.sh" que tiene tres parámetros de entrada: IP del nodo master, IP del nodo worker, IP del otro nodo worker. El script despliega los 3 nodos de kubernetes en las máquinas virtuales pasadas por parámetro mediante Ansible.
* Lanzar script "03-DesplegarApp" que tiene como parámetro el nodo que tiene el servidor nfs. El script despliega tres ejemplos de aplicación diferente en el clúster de kubernetes mediante Ansible.
