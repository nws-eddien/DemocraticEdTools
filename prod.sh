docker compose --env-file docker-compose/.env \
  -f docker-compose/docker-compose.prod.yml \
  $1 $2
