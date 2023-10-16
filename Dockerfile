FROM openjdk:11

RUN mkdir /app

COPY target/classes/ /app

WORKDIR /app

RUN pwd && ls

CMD java DockerTestApplication