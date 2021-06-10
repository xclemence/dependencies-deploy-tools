SET currentPath=%~dp0

for /f "delims== tokens=1,2" %%G in ("%currentPath%..\.env") do set %%G=%%H

call yarn --cwd "%PROJECTS_DIR%\dependencies-graph-graphql" build

docker-compose -f "%currentPath%../definitions/graphql/docker-compose.yml" ^
               --env-file "%currentPath%../.env" ^
               build ^
               --no-cache
