FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD 'root'
ENV MYSQL_DATABASE 'notes'
ENV MYSQL_USER 'notes-api'
ENV MYSQL_PASSWORD 'notes-api'

ADD ./scripts/database_schema.sql .
EXPOSE 3306