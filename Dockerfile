FROM node:alpine

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install -g @angular/cli

RUN npm install

CMD ["ng", "serve", "--host", "0.0.0.0"]





# # Etapa de construcción
# FROM node:alpine AS builder

# WORKDIR /usr/src/app

# COPY package*.json ./
# RUN npm install

# COPY . .
# RUN npm run build --prod

# # Etapa de producción
# FROM nginx:alpine
# COPY --from=builder /usr/src/app/dist/frontend-tpf /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]