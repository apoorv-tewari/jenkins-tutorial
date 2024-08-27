# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root user to perform installations
USER root

# Update package lists and install Python 3 and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Optionally, you can also install additional Python packages if needed
# RUN pip3 install <package-name>

# Switch back to the Jenkins user
USER jenkins

# Define the entrypoint for the Jenkins container (inherited from the base image)
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
