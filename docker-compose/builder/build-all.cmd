SET currentPath=%~dp0

call "%currentPath%/build-rest.cmd"
call "%currentPath%/build-graphql.cmd"
call "%currentPath%/build-viewer.cmd"
