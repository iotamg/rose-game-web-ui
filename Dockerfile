# Use the official Node.js 14 image as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Default values for environment variables
ENV CERT_PATH ""
ENV KEY_PATH ""
ENV HTTP_PROXY http://localhost:8090
ENV WS_PROXY http://localhost:8090
ENV PORT 8080

# Inform Docker that the container listens on port 3000
EXPOSE 8080

# Define the command to run your app using CMD which defines your runtime
CMD ["sh", "-c", "node server.js --cert ${CERT_PATH} --key ${KEY_PATH} --httpproxy ${HTTP_PROXY} --wsproxy ${WS_PROXY} --port ${PORT}"]
