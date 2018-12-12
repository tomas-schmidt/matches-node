#docker build --tag matchesapi .
#docker run --name matches-api -p 8080:8080 matchesapi
FROM node:10
WORKDIR /home/nodejs/app
COPY . .
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]
