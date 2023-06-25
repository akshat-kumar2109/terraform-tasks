module "rg" {
    source = "./rg"
}

module "network" {
    source = "./network"
}

module "vm" {
    source = "./linux-vm"
}

module "az_function" {
    source = "./az-function"
}
