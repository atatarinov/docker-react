FROM node:alpine as builder
# create a temp container and execute a set of commands
# it is called a multi-step build process
WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build


FROM nginx

COPY --from=builder /app/build usr/share/nginx/html
# copy build folder from the temp container