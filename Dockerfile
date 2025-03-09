# Use the official Node.js image as a base
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and pnpm-lock.yaml first for better caching
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Expose the application port (adjust if your app uses a different port)
EXPOSE 8080

# Start the application
CMD ["pnpm", "start"]
