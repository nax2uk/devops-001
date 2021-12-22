FROM node:14.14.0-alpine as builder 
WORKDIR /usr/src/app
COPY package.json /usr/src/app

RUN npm install
COPY . /usr/src/app
RUN npm run build

FROM nginx:1
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
