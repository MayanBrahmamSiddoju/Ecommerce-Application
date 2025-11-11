FROM node:18-alpine
WORKDIR /app

# Install deps
COPY package.json package-lock.json* ./
RUN npm ci --production

# Copy source
COPY . .

# If you need dev tools (nodemon) for local dev, either install separately or use a separate Dockerfile for dev.

EXPOSE 5000
CMD ["node", "index.js"]