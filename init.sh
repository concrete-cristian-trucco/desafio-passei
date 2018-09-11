#!/bin/bash
PASSWORD='root'
docker-compose up -d

## comando para criar o banco e a tabela que será usada pela aplicação

docker exec -i mysql mysql -u root -p${PASSWORD} -h localhost notes < database_schema.sql 2> /dev/null

echo "Listando Containers criados"

docker-compose ps

echo "Inserindo massa de teste"

curl -X POST http://localhost/notes --data {"Text":"Desafio"}
curl -X POST http://localhost/notes --data {"Text":"Passei"}
curl -X POST http://localhost/notes --data {"Text":"Direto"}

