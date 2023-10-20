# Micro-shop-setup

Please follow following steps:

1. Run **"sh setRegCluster.sh"**
    -  it will be create cluster and registry on local system.
2. Run **"sh deployAllRepo.sh"**
    -  it will pull repos from github and duid socker images and push those images in k3d registary
        
        *(Note: you can change branch name, This need to be modified )*

3. Run **"sh runServices.sh"** :
    - it will deploy all services  


4. Add hosts (Required step):
    - open hosts file and add host name whch is mentioned in ingress:
        > **gedit /etc/hosts** or use other editor like **vi** instead of gedit.

eg:
```
>> kubectl get ing

NAME                     CLASS    HOSTS              ADDRESS      PORTS   AGE
loan-predictor-ingress   <none>   loanpredictor.com  172.20.0.2   80      15h

```
hosts file

```
>> sudo gedit /etc/hosts

127.0.0.1	    localhost
172.20.0.2      loanpredictor.com
```

