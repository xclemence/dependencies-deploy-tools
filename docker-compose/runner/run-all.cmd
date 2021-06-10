SET currentPath=%~dp0

call "%currentPath%create-netework.cmd"
call "%currentPath%run-keycloak.cmd"

docker-compose -f "%currentPath%../definitions/wait/docker-compose.yml" run wait -c keycloak_keycloak_1:8080

call "%currentPath%run-neo4j.cmd"
call "%currentPath%run-api.cmd"
call "%currentPath%run-graphql.cmd"
call "%currentPath%run-viewer.cmd"
