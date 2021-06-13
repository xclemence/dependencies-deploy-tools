
crc setup

The server is accessible via web console at:
  https://console-openshift-console.apps-crc.testing

Log in as administrator:
  Username: kubeadmin
  Password: TpTbo-7VEWz-NUU8r-tY9Er

Log in as user:
  Username: developer
  Password: developer

Use the 'oc' command line interface:
  > @FOR /f "tokens=*" %i IN ('crc oc-env') DO @call %i
  > oc login -u developer https://api.crc.testing:6443

crc start --nameserver 1.1.1.1

login kubeadmin

oc new-project dep-graph
oc adm policy add-role-to-user edit developer -n dep-graph

oc create sa useroot
oc adm policy add-scc-to-user anyuid -z useroot

login developer

kubectl apply -f .\postgres\
kubectl apply -f .\keycloak\

Create new realm
Select dependencies-realm.json file
ok

kubectl apply -f .\neo4j\
kubectl apply -f .\graphql\
kubectl apply -f .\viewer\
kubectl apply -f .\rest\

crc stop
crc delete
crc cleanup
