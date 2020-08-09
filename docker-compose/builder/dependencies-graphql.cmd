docker-compose -f ../definitions/docker-compose.yml ^
               -f ../definitions/docker-compose-graphql.yml ^
               build ^
               --force-rm ^
               --no-cache