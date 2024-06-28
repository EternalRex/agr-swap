param webAppName string = uniqueString(resourceGroup().id)
param sku string = 'F1'
param location string = resourceGroup().location
var appServicePlanName = toLower('AppServicePlan-${webAppName}')

//resource for app service plan
resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  properties:{
    reserved: true
  }
  sku:{
    name: sku
    tier: 'Free'
    size: sku
  }
  kind: 'app'
}

//resource for app service
resource appService 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  kind: 'app'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig:{
      linuxFxVersion: 'NODE|20-lts'
      appSettings:[
        {
          name: 'AGRISWAP_APP_ENVIRONMENT'
          value: 'Development'
        }
      ]
    }
  }
}
