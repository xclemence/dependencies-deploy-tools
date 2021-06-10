SET currentPath=%~dp0

docker-compose -f "%currentPath%../definitions/keycloak/docker-compose.yml" ^
               up -d