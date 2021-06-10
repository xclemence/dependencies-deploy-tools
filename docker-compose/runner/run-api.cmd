SET currentPath=%~dp0

docker-compose -f "%currentPath%../definitions/api/docker-compose.yml" ^
               --env-file "%currentPath%../.env" ^
               up -d