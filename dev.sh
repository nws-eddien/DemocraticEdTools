docker compose \
  --env-file docker-compose/.dev.env \
  -f docker-compose/docker-compose.dev.yml \
  $1 $2
