# Use the official Jenkins LTS image from the Docker Hub
FROM jenkins/jenkins:lts

# Switch to root user to install additional tools (if needed)
USER root

# Install any additional packages or dependencies
# For example, install Maven
RUN apt-get update && apt-get install -y maven

# Switch back to the Jenkins user
USER jenkins

# Set up any environment variables or configurations if necessary
# ENV JAVA_OPTS="-Djava.awt.headless=true"

# Expose the port on which Jenkins will run
EXPOSE 8080

# Define the default command to run Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
