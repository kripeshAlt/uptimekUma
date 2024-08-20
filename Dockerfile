# Use the official Node.js image as a base image
FROM node:20-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the Uptime Kuma repository
RUN git clone https://github.com/louislam/uptime-kuma.git .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Expose the port Uptime Kuma will run on
EXPOSE 3001

# Command to run Uptime Kuma
CMD ["npm", "run", "start-server"]
