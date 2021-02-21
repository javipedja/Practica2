variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D2_v2" # 3.5 GB, 1 CPU 
}

variable "vms" {
  type = list(string)
  description = "Maquinas virtuales del cluster de kubernetes"
  default = ["master","worker01"]
}