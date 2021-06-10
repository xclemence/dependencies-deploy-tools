SET currentPath=%~dp0

docker-compose -f "%currentPath%../definitions/viewer/docker-compose.yml" ^
               --env-file "%currentPath%../.env" ^
               up -d
