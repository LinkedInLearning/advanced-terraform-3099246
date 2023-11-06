environment_instance_settings = {
    "DEV" = {
      machine_type = "f1-micro"
      labels = {
        environment = "dev"
      },
      redis = {
        name = "customer-id-cache",
        tier = "STANDARD_HA",
        memory_size_gb =1,
        display_name = "Customer Data Cache"
      }
    },
   "QA" = {
      machine_type = "e2-micro"
      labels = {
        environment = "qa"
      },
      redis = {
        name = "customer-id-cache",
        tier = "STANDARD_HA",
        memory_size_gb = 3,
        display_name = "Customer Data Cache"
      }
    },
    "STAGE" = {
      machine_type = "e2-micro"
      labels = {
        environment = "stage"
      },
      redis = {}
    },
    "PROD" = {
      machine_type = "e2-medium"
      labels = {
        environment = "prod"
      },
      redis = {}
    }
}