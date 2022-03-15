FROM openjdk
COPY target/*.jar /
EXPOSE 8080
ENTRYPOINT ["java","-jar","/sample-for-jenkins-0.0.1-SNAPSHOT.jar"]
RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
    && tar xzvf docker-17.04.0-ce.tgz \
    && mv docker/docker /usr/local/bin \
    && rm -r docker docker-17.04.0-ce.tgz
