#docker build -t dockertest .

FROM openjdk:11

RUN mkdir /app

COPY target/classes/ /app
COPY target/lib/ /app/lib/
WORKDIR /app

RUN pwd && ls
RUN whoami
CMD java -cp lib/log4j-api-2.21.1.jar:lib/log4j-core-2.21.1.jar:. DockerTestApplication
RUN wget -O splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb "https://download.splunk.com/products/universalforwarder/releases/9.0.4/linux/splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb"

#BindMounting a volume to share container log file with host 
#docker run --name=dockertest -d -v ~/dockertestlogs:/app/logs  dockertest
