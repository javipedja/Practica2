variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D2_v2" # 7 GB, 2 CPU 
}

variable "vm_sizes" {
  type = list(string)
  description = "Tamaño de la máquina virtual"
  default = ["Standard_A2_v2","Standard_A1_v2","Standard_A1_v2"]
}

variable "vms" {
  type = list(string)
  description = "Maquinas virtuales del cluster de kubernetes"
  default = ["master","worker01","worker02"]
}