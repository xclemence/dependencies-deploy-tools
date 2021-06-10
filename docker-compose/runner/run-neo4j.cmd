SET currentPath=%~dp0

docker-compose -f "%currentPath%../definitions/neo4j/docker-compose.yml" ^
               up -d