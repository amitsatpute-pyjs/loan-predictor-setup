# Micro-shop-setup

Please follow following steps:

1. Run **"sh setRegCluster.sh"**
    -  it will be create cluster and registry on local system.
2. Run **"sh deployAllRepo.sh"**
    -  it will pull repos from github and duid socker images and push those images in k3d registary
        
        *(Note: you can change branch name, This need to be modified )*

3. Run **"sh runServices.sh"** :
    - it will deploy all services  



eg:
```
>> kubectl get ing

NAME                 CLASS    HOSTS               ADDRESS      PORTS   AGE
micro-shop-ingress   <none>   loanpredictor.com   172.20.0.2   80      15h

```
hosts file

```

