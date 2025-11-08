# Stage 1: Build Java/Maven components
FROM maven:3.8.7-openjdk-17 AS maven_builder

WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build the Maven project
RUN mvn clean package -DskipTests

# Stage 2: Build Node.js application
FROM node:20-alpine AS node_builder

WORKDIR /app

# Copy Node.js application files
COPY package.json .
COPY package-lock.json .
COPY public ./public
COPY server.js . # Or your main Node.js entry point

# Install Node.js dependencies
RUN npm install

# Stage 3: Final image combining necessary artifacts
FROM node:20-alpine

WORKDIR /app

# Copy built Node.js application from node_builder
COPY --from=node_builder /app/node_modules ./node_modules
COPY --from=node_builder /app/public ./public
COPY --from=node_builder /app/server.js .

# If Maven built a JAR or other artifact needed by Node.js, copy it
# For example, if your Node.js app serves a Java-built JAR:
# COPY --from=maven_builder /app/target/your-java-app.jar ./java-app.jar

# Expose the port your Node.js application listens on
EXPOSE 3000

# Command to run the Node.js application
CMD ["node", "server.js"]