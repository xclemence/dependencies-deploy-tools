# Deploy Dependencies Graph with docker compose

/!\ All scripts are designed for development. They work with source codes (image building instead of docker hub downloading)

## Prerequisites
- docker
- npm
- angular cli
- dependencies sources files 


## Configuration

Update .env with sources directory

```
PROJECTS_DIR=C:\Sources\dependencies
```

## Description

The project use docker compose profiles to pilot the selected containers services.

### Service
- rest-api: [dependencies graph rest api](https://github.com/xclemence/dependencies-graph-services)
- graphq-api: [dependencies graph graphql api](https://github.com/xclemence/dependencies-graph-graphql)
- keycloak: authentication provider (keycloak + postgres)
- neo4j: graph database
- viewer: [dependencies graph viewer](https://github.com/xclemence/dependencies-graph-viewer)

### Builders
Scripts bat to build sources and generate docker images. All images are tagged with "test" version

### Runners
Scripts bat to create containers (one bat by tools + one for all)

## Tools

### Export Keycloak configuration

```console
docker exec -it dependencies-graph_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.realmName=dependencies -Dkeycloak.migration.usersExportStrategy=REALM_FILE -Dkeycloak.migration.file=/tmp/dependencies.json
```

### Import Keycloak configuration

```console

docker exec -it dependencies-graph_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh -Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.strategy=OVERWRITE_EXISTING -Dkeycloak.profile.feature.upload_scripts=enabled -Dkeycloak.migration.file=/tmp/dependencies.json

```