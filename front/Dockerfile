# ----------------------------
# build from source
# ----------------------------
FROM node:current-alpine3.16 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# ----------------------------
# run with nginx
# ----------------------------
FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
COPY --from=build /app/dist/myapplication /usr/share/nginx/html

EXPOSE 80