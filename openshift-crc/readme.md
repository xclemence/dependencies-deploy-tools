# Deploy Dependencies Graph on OpenShift (CodeReady Containers)

## Prerequisite
- [CodeReady Containers (crc)](https://cloud.redhat.com/openshift/create/local)
- [OpenShift Client CLI (oc)](https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/)

## Run crc

- Run setup command
```console
crc setup
```

- Start service
```console
crc start --nameserver 1.1.1.1
```
- Set pull secret available on crc [download page](https://cloud.redhat.com/openshift/create/local)
```console
Started the OpenShift cluster.

The server is accessible via web console at:
  https://console-openshift-console.apps-crc.testing

Log in as administrator:
  Username: kubeadmin
  Password: Fx6yf-ahJ8f-HnJ7L-LzsKK

Log in as user:
  Username: developer
  Password: developer

Use the 'oc' command line interface:
  PS> & crc oc-env | Invoke-Expression
  PS> oc login -u developer https://api.crc.testing:6443
```

## Create/configure the project
- Logon with "kubeadmin"
```console
oc login -u kubeadmin https://api.crc.testing:6443
```

- Create project 
```console
oc new-project dep-graph
```

- Set rights to developer user
```console
oc adm policy add-role-to-user edit developer -n dep-graph
```

- create useroot to run containers with root user
```console
oc create sa useroot
```

- Create the good policy to allow any user to run container
```console
oc adm policy add-scc-to-user anyuid -z useroot
```

## Install dependencies graph

Logon with "developer"
- oc login -u developer https://api.crc.testing:6443

### keycloak
- Deploy Postgres database for Keycloak
```console
kubectl apply -f .\postgres\
```

- Deploy Keycloak
```console
kubectl apply -f .\keycloak\
```
- Logon to Keycloak
  - http://keycloak-dep-graph.apps-crc.testing/auth/
  - user: admin
  - password: admin
  - Add realm
  - Select file: dependencies-realm.json file
  - Create

- Deploy neo4j
```console
kubectl apply -f .\neo4j\
```

- Deploy graphql api (/!\ need Keycloak)
```console
kubectl apply -f .\graphql\
```

- Deploy viewer
```console
kubectl apply -f .\viewer\
```

- Deploy rest api
```console
kubectl apply -f .\rest\
```
## cleanup

- Stop the CodeReady Containers virtual machine and OpenShift cluster
```console
crc stop
```

- Delete the existing CodeReady Containers virtual machine
```console
crc delete
```

- Clean up remaining changes from the crc setup command
```console
crc cleanup
```
