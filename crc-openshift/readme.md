# Deploy Dependencies Graph on kubernetes with Ansible

## Prerequisite
- [CodeReady Containers (crc)](https://cloud.redhat.com/openshift/create/local)
- [OpenShift Client CLI (oc)](https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/)

## Run crc

- Run steup command
```console
crc setup
```
```console
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

```

- Start service

```console
crc start --nameserver 1.1.1.1
```

## Create/configure project
- logon with kubeadmin
- create project 
```console

oc new-project dep-graph
```
- set rights to developer user
```console
oc adm policy add-role-to-user edit developer -n dep-graph
```
- create useroot to run conaitner with root user
```console
oc create sa useroot
oc adm policy add-scc-to-user anyuid -z useroot
```

## Install dependencies graph

logon with  developer

### keycloak


```console
kubectl apply -f .\postgres\
kubectl apply -f .\keycloak\
```

Create new realm
Select dependencies-realm.json file
ok

```console

kubectl apply -f .\neo4j\
kubectl apply -f .\graphql\
kubectl apply -f .\viewer\
kubectl apply -f .\rest\
```

## cleanup

```console
crc stop
crc delete
crc cleanup
```
