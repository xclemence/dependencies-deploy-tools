docker-compose -f ../definitions/docker-compose.yml ^
               -f ../definitions/docker-compose-api.yml ^
               build ^
               --force-rm ^
               --no-cache