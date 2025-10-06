# Use the official Node.js 16 base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy only the package.json and package-lock.json (if available)
# This allows Docker to cache npm install layer unless dependencies change
COPY package*.json ./

# Install dependencies defined in package.json
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 so the app is accessible outside the container
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
