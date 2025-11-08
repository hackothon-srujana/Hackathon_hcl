# Stage 1: Build the application
FROM node:lts-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if present) to leverage Docker's cache
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run the build command (e.g., for a React, Angular, or Vue application)
# Adjust this command based on your project's build script
RUN npm run build

# Stage 2: Create the final production image
FROM node:lts-alpine AS runner

# Set the working directory
WORKDIR /app

# Copy only the necessary build artifacts from the builder stage
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# Expose the port your application listens on
EXPOSE 3000

# Command to run the application in production
# Adjust this based on how your application starts (e.g., serving static files or running a Node.js server)
CMD ["npm", "start"]