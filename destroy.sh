
#!/bin/bash
## Rode somente se quiser limpar todos objetos do Docker

echo "Remove todos os Containes"
docker-compose down

echo "Remove todos os Volumes"
docker volume prune --force

echo "Remove todos os Containes não usados"
docker system prune --force

##Se quiser limpar imagens também descomente aqui.
#echo "Remove todas imagens sem tags"
#docker image prune --force  