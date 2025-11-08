# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
# This step is optimized to leverage Docker's layer caching.
# Copying pom.xml first allows caching of dependencies if only source code changes.
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:17-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage to the current stage
COPY --from=build /app/target/*.jar app.jar

# Set the command to run the application
CMD ["java", "-jar", "app.jar"]