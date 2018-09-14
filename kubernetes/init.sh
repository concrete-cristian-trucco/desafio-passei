#!/bin/bash
PASSWORD='root'

echo "buildando as imagens que seram usadas nos containers"
kubectl apply -f deployment.yaml  

echo "Subindo o Docker Compose"
kubectl apply -f desafio-services.yaml   

## comando  Docker para criar o banco e a tabela que será usada pela aplicação Node.

kubectl exec -i mysql-deployment-68ff658774-qcpjl mysql -u root -p${PASSWORD} -h localhost notes < database_schema.sql 2> /dev/null

echo "Listando Containers criados"
kubectl get pods,svc 

echo
echo "Gerenciando Aplicativos"
kubectl exec -i application-deployment-6c86fb674b-v757j  pm2 start server.js
echo 
echo
echo "sleep 10 segundos para subir o banco"
sleep 10
#echo "Inserindo massa de teste"

curl -X POST http://localhost:31080/notes --data {"Text":"Desafio"}
echo " :Teste Inserido"
curl -X POST http://localhost:31080/notes --data {"Text":"Passei"}
echo " :Teste Inserido"
curl -X POST http://localhost:31080/notes --data {"Text":"Direto"}
echo " :Teste Inserido"


