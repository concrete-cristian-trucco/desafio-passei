FROM node:10.10.0-alpine
USER node
ARG NODE=production
ENV NODE_ENV=${NODE}
ENV NODEJS_API_PORT=8080

RUN npm install pm2 -g \
    apk update && \
    apk upgrade && \
    apk add mysql-client 

WORKDIR /usr/src/app

COPY   .   /usr/src/app
RUN npm install

EXPOSE 8080

CMD [ "npm", "start", "server.js" ]