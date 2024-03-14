FROM maven:3.9.6-amazoncorretto-8-debian-bookworm

WORKDIR /usr/src/app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY . .

RUN mvn package

EXPOSE 8080

CMD java -jar ./target/docker-example-1.1.3.jar