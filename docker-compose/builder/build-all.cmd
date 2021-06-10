SET currentPath=%~dp0

call "%currentPath%/build-api.cmd"
call "%currentPath%/build-graphql.cmd"
call "%currentPath%/build-viewer.cmd"
