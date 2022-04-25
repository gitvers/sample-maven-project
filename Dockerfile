FROM openjdk
COPY target/*.jar /
EXPOSE 3000
ENTRYPOINT ["java","-jar","/sample-for-jenkins-0.0.1-SNAPSHOT.jar"]

