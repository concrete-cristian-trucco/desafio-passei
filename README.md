# Desafio Passei Direto - DevOps
---
titulo: Desafio
descrição: Desafio passei direto criar uma infraestrutura para Docker com os 3 container (nginx,application e mysql)
autor: Cristian Trucco
autor: cristian-trucco
data: 10/09/2018
---

---
Obs: Branch develop tem outros cenários.
---

- Para iniciar os containers Docker rode o script (./init.sh) que está na raiz do repositório.
```
  ./init.sh
 ```  
* O script init.sh irá subir o docker-compose com os 3 container (nginx,application e mysql) e após isso irá rodar o script sql no container Mysql, para criar a tabela Notes no banco de dados.
  
- Para testar a Api Node.
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

### Usando o PWD
- Caso não tenha Docker na máquina rode no Play With Docker
  * http://play-with-docker.com/

- Após estar logado e com o terminal iniciado no PWD faça:
  ```
  git clone https://github.com/concrete-cristian-trucco/desafio-passei.git
  cd desafio-passei/
  ./init.sh
  ```
  
### Removendo os containers
- Para remover os containers e limpar o ambiente use o script destroy.sh
  ```
  ./destroy.sh
  ```  
