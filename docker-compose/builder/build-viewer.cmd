SET currentPath=%~dp0

for /f "delims== tokens=1,2" %%G in (../.env) do set %%G=%%H

call yarn --cwd "%PROJECTS_DIR%\dependencies-graph-viewer" ng build

docker-compose -f "%currentPath%../definitions/viewer/docker-compose.yml" ^
               --env-file "%currentPath%../.env" ^
               build ^
               --no-cache
