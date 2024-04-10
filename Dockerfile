# Use OpenJDK 17 on Debian Buster as the base image
FROM openjdk:17-jdk-buster

# Set the working directory to /app
WORKDIR /app

# Install unzip
RUN apt-get update && apt-get install -y unzip

# Copy the JMeter zip file into the container
COPY apache-jmeter-5.4.3.zip .

# Unzip the JMeter zip file
RUN unzip apache-jmeter-5.4.3.zip && rm apache-jmeter-5.4.3.zip

# Navigate into the JMeter bin directory
WORKDIR /app/apache-jmeter-5.4.3/bin

# Uncomment and set the server.rmi.localport and server.rmi.ssl.disable properties
RUN sed -i 's/#server.rmi.localport=.*/server.rmi.localport=4000/' jmeter.properties
RUN sed -i 's/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/' jmeter.properties

# Keep the container running
CMD ["tail", "-f", "/dev/null"]