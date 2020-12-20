FROM nginx:latest

USER root

RUN usermod -a -G docker jenkins

USER jenkins
# Copy source code to working directory
COPY index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80
