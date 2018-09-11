FROM node:boron

ARG NODE=production
ENV NODE_ENV=${NODE}
ENV NODEJS_API_PORT=8080

RUN npm install pm2 -g \
    && apt-get update -q \
    && apt-get install mysql-client -y -q

WORKDIR /usr/src/app

COPY   .   /usr/src/app
RUN npm install

EXPOSE 8080

CMD [ "npm", "start", "server.js" ]