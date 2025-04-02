# Use the official CentOS image as the base image
FROM centos:latest

# Update the package repository and install Java 11
RUN yum update -y && \
    yum install -y java-11-openjdk-devel

# Install wget which will be used to download Elasticsearch RPM
RUN yum install -y wget

# Download and install Elasticsearch RPM
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.2-x86_64.rpm && \
    rpm -ivh elasticsearch-7.10.2-x86_64.rpm

# Configure Elasticsearch
RUN sed -i '/^#http.port/c\http.port: 9200' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/^#network.host/c\network.host: 0.0.0.0' /etc/elasticsearch/elasticsearch.yml && \
    echo "discovery.seed_hosts: ['host1', 'host2']" >> /etc/elasticsearch/elasticsearch.yml

# Expose port 9200 for HTTP
EXPOSE 9200

# Expose port 9300 for internal communication
EXPOSE 9300

# Start Elasticsearch service
CMD ["systemctl", "start", "elasticsearch"]
