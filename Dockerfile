#docker build --tag nodeapp .
#docker run --name matches-app -p 8080:8080 nodeapp
FROM node:10
WORKDIR /home/nodejs/app
COPY . .
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]
