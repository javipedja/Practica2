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

* Lanzar script "01    " encargado de la creación de la infrastructura en Azure mediante la utilización de Terraform.
* Lanzr script "02     "
* 
Empezamos el desarrollo creando un repositorio en git.

Creamos los ficheros terrafor y el de credenciales, lo añadimos al git ignore para que no suba al repositorio.

Aceptamos los terminos de azure para la suscripción:

az vm image terms show --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810

az vm image accept-terms --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810

conectarme con la clave publica de mi maquina por ssh con 

ssh adminUsername@20.71.38.22

Maquinas virtuales provisionadas son de 2 nucleos y solo 2 porque la suscripción a Azure de estudiante tiene la limitación de 4cpus virtuales, asi que en ve de 4 maquinas realizaremos al instalación en 2 maquinas.


Ansible

En la carpeta de ansible_k8s tenemos los playbooks apra su instalación

hosts --> inverntarios, definición de los hosts donde trabajara ansible

Configuramos la siguientes estructura:

    1º Maquina virtual--> Master y nfs
    2º Maquina --> worker (minion)

Creamos un fichero de variables para asible donde definimos las ips de los nodos.

Probamos conexion con los nodos
 ansible -i hosts -m ping all
13.94.205.86 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
13.94.205.71 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
antes hay que conectar por ssh para aceptar la conexión si no ansible no puede conectar.(Poner pantalla de pregunta)
ssh adminUsername@52.174.101.106
The authenticity of host '52.174.101.106 (52.174.101.106)' can't be established.
ECDSA key fingerprint is SHA256:VCPC7dXpdNupHG2H1WJBMW0pyGTMVLoOjEeF7mEm3As.
Are you sure you want to continue connecting (yes/no/[fingerprint])?          

Instlamos chrony
Hablamos de Chrony, una implementación flexible de NTP (Protocolo de Tiempo de Red) Se utiliza para sincronizar el reloj del sistema desde diferentes servidores NTP, relojes de referencia o mediante una entrada manual.

crear un usuario , por ejemplo llamado ansible
que utilizaremos con ansible, le ponemos una contraseña
adduser md /home/ansible ansible
passwd ansible


para reducir gastos en al suscripción  apramso las maquinas de azures
az vm stop --name vm-worker01 --resource-group kubernetes_rg    

Si ya hicimos el init hay que resetear
kubeadm reset

