FROM openjdk
COPY target/*.jar /
RUN apt update
EXPOSE 8080
ENTRYPOINT ["java","-jar","/sample-for-jenkins-0.0.1-SNAPSHOT.jar"]

