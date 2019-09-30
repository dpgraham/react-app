FROM node:alpine as builder
WORKDIR /client
COPY /client/package.json .
RUN npm install
COPY /client/ .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /client/build /usr/share/nginx/html
