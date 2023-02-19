module "aws" {
  source = "modules/aws"               
  environment = { 
    name             = "AWS"                                         
    background_color = "orange"                                      
  }
}
 
module "azure" {
  source = "modules/azure"             
  environment = {
    name             = "Azure"
    background_color = "blue"
  }
}
 
module "gcp" {
  source     = "modules/gcp"           
  environment = {
    name             = "GCP"
    background_color = "red"
  }
}
 
module "loadbalancer" {
  source = "loadbalancer"      
  addresses = [
    module.aws.network_address,                                      
    module.azure.network_address,                                    
    module.gcp.network_address,                                      
  ]
}