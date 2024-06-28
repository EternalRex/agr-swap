param sku string = 'Free'
param location string = resourceGroup().location





resource staticWebApp 'Microsoft.Web/staticSites@2023-12-01'= {
  name: 'agriSwapStaticWeb'
  location: location
  properties:{
    repositoryUrl: 'https://github.com/EternalRex/agr-swap.git'
    branch:'main'
    buildProperties: {
      appArtifactLocation: 'agri-swap-front-end-artifact'
    }
  }
  sku:{
    name: sku
  }
}


