SET currentPath=%~dp0

docker-compose -f "%currentPath%../definitions/wait/docker-compose.yml" ^
               up -d