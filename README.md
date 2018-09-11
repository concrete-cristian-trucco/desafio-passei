# desafio
- Para start do serviços ./init.sh
* script init.sh irá subir o docker-compose com os 3 container (nginx,application e mysql)
* e após isso irá rodar o script sql no container Mysql, para criar a tabela Notes no banco de dados.
  
- Para testar Api
```
    http://localhost/notes
```
- Para test POST: 
 ```
     curl -X POST http://localhost/notes --data {"Text":"test"}
 ```   
- Para test DELETE:
```
     curl -X DELETE http://localhost/notes/1
```