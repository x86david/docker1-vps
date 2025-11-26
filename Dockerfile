# Stage 1: Build Angular app
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install -g @angular/cli && npm install
COPY . .
RUN ng build --configuration production

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine
COPY --from=build /app/dist/portfolio /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
