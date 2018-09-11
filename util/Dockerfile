FROM node

WORKDIR  /

RUN npm install  pm2 -g \
          && apt-get update -q \
          && apt-get install mysql-client -y -q

COPY   .   / 
RUN npm install
EXPOSE 8080

CMD [ "npm", "start", "server.js" ] 