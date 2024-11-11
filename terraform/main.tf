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


# ssh public key for nodes
# ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAr+1RJwE2bP9LmJ2wHFXVow3rU1hkd7P1w45p1WnFz5InD6RPHZfOxRni9Dkwp+NxkMZGf6zHv7lgE13s4Gp2Yrge9GF+P8dHiZ2tLf1wYJQ5TKJ+4fOjeH1V1qjLUaIriIEGoQ4L1P3MBa8DgHkCuW1lLnnAn8Q

# TO CONNECT TO AKS VIA CLI
# az aks get-credentials --resource-group nodegrouptest6695 --name akstest6695

# TO GET CREDENTIALS
# az ad sp create-for-rbac --name github-actions --role Contributor --scopes /subscriptions/53a78f6a-ffcb-430f-acc6-742d98756f39/resourceGroups/nodegrouptest6695 --sdk-auth

# CREDENTIALS
