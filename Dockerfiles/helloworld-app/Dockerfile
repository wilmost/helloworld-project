FROM node:21-alpine as BUILD_IMAGE
WORKDIR /usr/src/helloworld-app
RUN apk --no-cache add git
RUN git clone https://github.com/your-username/your-repo.git .
COPY package*.json ./

RUN npm install 
COPY . . 
RUN npm run build:prod

FROM  nginx:alpine as PRODUCTION_IMAGE
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY  --from=BUILD_IMAGE /app/helloworld-app/dist/ /usr/share/nginx/html/helloworld-app/
EXPOSE 8081
ENTRYPOINT ["nginx", "-g", "daemon off;"]