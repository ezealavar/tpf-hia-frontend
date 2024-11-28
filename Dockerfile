FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod

# Servir los archivos estáticos usando nginx
FROM nginx:alpine
COPY --from=0 /usr/src/app/dist/tffrontend /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


# FROM node:alpine

# WORKDIR /usr/src/app

# COPY . /usr/src/app

# RUN npm install -g @angular/cli

# RUN npm install

# CMD ["ng", "serve", "--host", "0.0.0.0"]