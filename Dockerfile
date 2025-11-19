FROM node:25-alpine3.21
RUN mkdir nodejs/
COPY app nodejs/
WORKDIR /nodejs/app
RUN npm install 
CMD [ "npm", "start" ]