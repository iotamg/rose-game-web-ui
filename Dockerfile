# Use the official Node.js 20 image as a parent image
FROM registry.access.redhat.com/ubi9/nodejs-20

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
USER 0
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Set user
USER 1001

# Default values for environment variables
ENV HTTP_PROXY http://localhost:8880
ENV WS_PROXY http://localhost:8880
ENV PORT 8080

# Inform Docker that the container listens on port 3000
EXPOSE 8080

# Define the command to run your app using CMD which defines your runtime
CMD npm start -- --httpproxy ${HTTP_PROXY} --wsproxy ${WS_PROXY} --port ${PORT}
