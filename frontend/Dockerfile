# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only the necessary files
COPY package*.json ./
RUN npm install

# Copy the source files
COPY src ./src
COPY public ./public # If you have a public folder for static assets

# Build the application
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the built files from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy the Nginx configuration
COPY ../nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

