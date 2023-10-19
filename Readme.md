# GKE SETUP

Please follow following steps:

1. **"install gcloud and kubectl"**
2. Run **"gcloud init"**
    -  it will connect yout to google cloud acoount
        
        *(Note: you can use User account or service account while doing gcloud init )*

3. Run **"gcloud container clusters get-credentials app-migration-poc-gke        --region us-central1 --project app-migration-poc"** :
    - it will connect the gke cluster   
      *(Note: you canget this connection string from gke cluster)*
4. Clone **"microshop setup repo"**

5.  Run **"sh runServices.sh"**
    -  it will deploy all the services to gke

6   Run ** sh updatePods.sh"**
        


