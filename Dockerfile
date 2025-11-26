# Stage 1: Build Angular app
FROM node:22 AS build
WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./
RUN npm install -g @angular/cli && npm ci

# Copy source code
COPY . .

# Build optimized Angular bundle
RUN ng build --configuration production

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine
# Remove default config
RUN rm /etc/nginx/conf.d/default.conf
# Copy custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copy built Angular app
COPY --from=build /app/dist/portfolio /usr/share/nginx/html
