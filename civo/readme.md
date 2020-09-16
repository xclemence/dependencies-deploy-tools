# Deploy Dependencies Graph on Civo K3

## Prerequisite

Create an account on [Civo](https://www.civo.com/)
Create a Kubernetes Cluster (no specific feature required)
Install [Helm](https://helm.sh/) on local computer

Add user for dashboard connection (folder user)

## Helm softwares
### kubernetes-dashboard

UI interface to managed 

```console
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace="kubernetes-dashboard" --set fullnameOverride="kubernetes-dashboard" --create-namespace 
```

To find an authentication token, use the following command:

```console
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | sls admin-user | ForEach-Object { $_ -Split '\s+' } | Select -First 1)
```

### ingress nginx controller
Controller for ingress item

```console
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace
```

### Cert manager
Kubernetes add-on to automate the management and issuance of TLS certificates.

```console
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.1 --set installCRDs=true --create-namespace
```

### Longhorn

No helm repo compatible with Longhorn. You need to clone Longhorn repository

```console
git clone https://github.com/longhorn/longhorn
```

And install Longhorn form local file system
```console
helm install longhorn ./longhorn/chart/ --namespace longhorn-system --create-namespace 
```

## Dependencies Graph

Deploy all yaml files inside services and ingress directories
