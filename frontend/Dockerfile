# Stage 1 — build the React app
FROM node:18-alpine AS builder
WORKDIR /app
# install only production dependencies for a faster, reproducible install
COPY package.json package-lock.json* ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2 — serve with nginx
FROM nginx:stable-alpine
# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build /usr/share/nginx/html
# Copy a custom nginx config if you have client-side routing:
# COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]