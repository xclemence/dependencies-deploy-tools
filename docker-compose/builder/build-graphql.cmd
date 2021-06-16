SET currentPath=%~dp0

for /f "delims== tokens=1,2" %%G in (..\.env) do set %%G=%%H

call yarn --cwd "%PROJECTS_DIR%\dependencies-graph-graphql" build

docker-compose -f "%currentPath%..\dependencies-graph\docker-compose.yml" ^
               --env-file "%currentPath%..\.env" ^
               --profile graphql ^
               build ^
               --no-cache