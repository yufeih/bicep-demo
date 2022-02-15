var environment = 'PubDev'

module storage '1-storage-1.bicep' = {
  name: 'storage'
}

module webapp '2-webapp-3.bicep' = {
  name: 'webapp'
  params: {
    environment: environment
    appSettings: {
      STORAGE_URL: storage.outputs.url
    }
  }
}
