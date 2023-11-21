FROM openjdk:11

RUN mkdir /app

COPY target/classes/ /app
COPY target/lib/ /app/lib/
WORKDIR /app

RUN pwd && ls

CMD java -cp lib/log4j-api-2.21.1.jar:lib/log4j-core-2.21.1.jar:. DockerTestApplication