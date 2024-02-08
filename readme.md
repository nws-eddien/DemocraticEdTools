Installation:

- Ip in docker-compose/.dev.env auf eigene locale ip ändern. (localhost funktioniert nicht)
- bash dev.sh build
- bash dev.sh up
- Im Browser localhost:9000 öffnen, mit den daten aus .dev.env anmelden und bucket rails-bucket erstellen
- docker exec -it dst_rails_dev rails db:create
- docker exec -it dst_rails_dev rails db:migrate
- docker exec -it dst_rails_dev rails db:seed
- browser: localhost:3101
- anmelden mit admin/123
