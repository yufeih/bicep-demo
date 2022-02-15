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

module mywebapp 'br:docseng.azurecr.io/webapp:v1.0.01800.138' = {
  name: 'mywebapp'
  params: {
    baseName: 'mywebapp'
    componentName: 'mywebapp'
    environment: environment
  }
}
