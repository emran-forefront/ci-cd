param location string
param storageAccounts array
param virtualNetworks array

module storageModule 'storage.bicep' = [for storage in storageAccounts: {
  name: 'storage-${storage.name}'
  params: {
    storageAccountName: storage.name
    location: location
    skuName: storage.sku
  }
}]

module networkModule 'network.bicep' = [for vnet in virtualNetworks: {
  name: 'vnet-${vnet.name}'
  params: {
    vnetName: vnet.name
    location: location
    addressPrefix: vnet.addressPrefix
    subnetPrefix: vnet.subnetPrefix
  }
}]
