
FROM adoptopenjdk/openjdk8
WORKDIR /app
COPY target/*.jar /app/carts.jar
EXPOSE 8081
CMD ["java", "-jar" ,"carts.jar"]