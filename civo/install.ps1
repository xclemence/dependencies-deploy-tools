# helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo add jetstack https://charts.jetstack.io

helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace="kubernetes-dashboard" --set fullnameOverride="kubernetes-dashboard" --create-namespace 
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.1 --set installCRDs=true --create-namespace

helm install longhorn ./longhorn/chart/ --namespace longhorn-system --create-namespace 
