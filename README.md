# Desafio

 - **Obs**: Branch develop estou testando a imagem Alpine (73mb), está funcionando e subindo o projeto mais rápido. Funcionando!!!
  
- Para iniciar os containers Docker rode o script (./init.sh) que está na raiz do repositório.
```
  ./init.sh
 ```  
* O script init.sh irá subir o docker-compose com os 3 container (nginx,application e mysql) e após isso irá rodar o script sql no container Mysql, para criar a tabela Notes no banco de dados.
  
- Para test POST usando a Api: 
 ```
     curl -X POST http://localhost/notes --data {"Text":"test"}
 ```   
- Para test DELETE:
```
     curl -X DELETE http://localhost/notes/1
```
- Para testar a Api Node.
```
    http://localhost/notes
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

### Bonus Docker Swarm
- O arquivo (docker-compose-swarm.yml) já está preparado para rodar em um cluster Swarm.
- **Obs**: Necessário ter um cluster Swarm iniciado para que o comando abaixo (stack deploy) funcione.
- **Dica** Utilize o PWD para rodar esse cenário. Basta clicar no icone da ferramenta que ele abre a opção de criar um cluster boostrap com 3 Managers e 2 Workes.

* Após isso rode os comandos na sequência:
  
```
  git clone https://github.com/concrete-cristian-trucco/desafio-passei.git
  cd desafio-passei/
  ### Lembrando que esse passo está na branch develop
  git checkout develop

  docker stack deploy -c docker-compose-swarm.yml desafio
```

- Listando o serviços criados no cluster 
  ```
  docker service ls
  ```
  
  - Docker Hub das Imagens criadas.
  - https://hub.docker.com/u/concretecristiantrucco/
