
FROM ubuntu:trusty
MAINTAINER Ernesto Alejo <ernestokarim@gmail.com>

# Update system packages and install some common tools
RUN apt-get update
RUN apt-get install software-properties-common -y

# Install Java PPA
RUN apt-add-repository ppa:webupd8team/java -y
RUN apt-get update

# Install Oracle Java 7
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install oracle-java7-installer -y

# Download and extract Solr
ENV SOLR_VERSION 4.9.0
ENV SOLR solr-$SOLR_VERSION
RUN mkdir -p /opt
ADD http://ftp.cixug.es/apache/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
RUN tar -C /opt --extract --file /opt/$SOLR.tgz
RUN ln -s /opt/$SOLR /opt/solr

# Expose to network the Solr port
EXPOSE 8983

# App to run on init
CMD ["/bin/bash", "-c", "cd /opt/solr/example; java -jar start.jar"]
