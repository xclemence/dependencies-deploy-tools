docker-compose -f ../definitions/docker-compose.yml ^
               -f ../definitions/docker-compose-api.yml ^
               -f ../definitions/docker-compose-graphql.yml ^
               -f ../definitions/docker-compose-view.yml ^
               build ^
               --force-rm ^
               --no-cache
