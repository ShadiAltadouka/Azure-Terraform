module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = module.nsg.resource_group_name
  location            = module.nsg.location

  depends_on = [module.resource_group]
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.acr.resource_group_name
  location            = module.acr.location
  acr_name            = module.acr.acr_name

  depends_on = [module.resource_group]
}

module "aks_cluster" {
  source              = "./modules/aks_cluster"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.aks_cluster.location
  aks_cluster_name    = module.aks_cluster.aks_cluster_name
  vnet_subnet_id      = module.nsg.subnet_id
  acr_login_server    = module.acr.acr_login_server
  acr_name            = module.acr.acr_name
  ssh_key_data        = module.aks_cluster.ssh_key_data

  depends_on = [module.resource_group]
}
