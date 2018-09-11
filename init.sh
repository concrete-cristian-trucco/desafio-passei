#!/bin/bash
PASSWORD='root'
docker-compose up -d
#cd  mysql/scripts/database_schema.sql
docker exec -i mysql mysql -u root -p${PASSWORD} -h localhost notes < database_schema.sql 2> /dev/null