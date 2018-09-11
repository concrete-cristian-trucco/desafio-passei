#!/bin/bash
PASSWORD='root'

echo "buildando as imagens que seram usadas nos containers"
docker-compose build

echo "Subindo o Docker Compose"
docker-compose up -d

## comando  Docker para criar o banco e a tabela que será usada pela aplicação Node.

docker exec -i mysql mysql -u root -p${PASSWORD} -h localhost notes < database_schema.sql 2> /dev/null

echo "Listando Containers criados"

docker-compose ps
echo
echo "Gerenciando Aplicativos"
docker exec -i application pm2 start server.js
echo 
echo
echo "sleep 10 segundos para subir o banco"
sleep 10
#echo "Inserindo massa de teste"

curl -X POST http://localhost/notes --data {"Text":"Desafio"}
echo " :Teste Inserido"
curl -X POST http://localhost/notes --data {"Text":"Passei"}
echo " :Teste Inserido"
curl -X POST http://localhost/notes --data {"Text":"Direto"}
echo " :Teste Inserido"


