##
## Production
#
FROM node:15.6-alpine3.10 as builder 
WORKDIR '/app'
COPY package.json .
#RUN npm install -g npm@7.4.3
RUN npm install --silent
COPY . .
RUN npm run build

FROM nginx:1.19-alpine 
COPY --from=builder /app/build /usr/share/nginx/html 
EXPOSE 80
