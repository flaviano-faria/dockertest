# Spring Splunk Integration

A sample Java application that demonstrates Docker containerization and integration with Splunk for log forwarding and analysis.

## Description

This project creates a sample Java application and builds a Docker image from the Java archive. The application is configured to work with **Splunk Universal Forwarder** for log collection and analysis.

## Prerequisites

- **Java Development Kit (JDK)** 8 or higher
- **Apache Maven** 3.x
- **Docker Engine**
- **Splunk Universal Forwarder** (for log forwarding)
- **Splunk Enterprise** (optional, for log analysis)

## Building the Application

### Create Java Archive

Run **Maven install** to create the Java archive:

```bash
mvn install
```

### Build Docker Image

Build the **Docker image** from the Dockerfile:

```bash
docker build -t <docker_image_name> <Dockerfile_directory>
```

## Running the Application

### Run Docker Container

Run a new container to test the application:

```bash
docker run <image_id>
```

### Bind Mount Volume (Optional)

To share container log files with the host, use **volume mounting**:

```bash
docker run --name=dockertest -d -v ~/dockertestlogs:/app/logs dockertest
```

## Splunk Setup

### Start Splunk Container

Start a **Splunk container** with the following configuration:

```bash
docker run --network skynet --hostname splunkhost -d -p 8000:8000 \
  -e "SPLUNK_START_ARGS=--accept-license" \
  -e "SPLUNK_PASSWORD=12345678" \
  --name splunk splunk/splunk
```

> **Note:** Access Splunk web interface at `http://localhost:8000` with username **admin** and the password specified above.

### Install Universal Forwarder on Host Server

Download and install **Splunk Universal Forwarder**:

```bash
wget -O splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb \
  "https://download.splunk.com/products/universalforwarder/releases/9.0.4/linux/splunkforwarder-9.0.4-de405f4a7979-linux-2.6-amd64.deb"
```

### Universal Forwarder Configuration

#### Check Logs

```bash
/opt/splunkforwarder$ sudo cat var/log/splunk/splunkd.log
```

#### Enable Listen Port

Enable the **listen port** for receiving data:

```bash
/opt/splunkforwarder/bin$ ./splunk enable listen 9997 -auth <user>:<password>
```

#### Configure Directory Monitoring

Configure the Universal Forwarder to **monitor a specific directory**:

```bash
/opt/splunkforwarder/bin$ ./splunk add monitor /home/taj/dockertestlogs
```

#### Verify Configuration

Check **forward server** and **monitor** configurations:

```bash
./splunk list forward-server
./splunk list monitor
```

## Splunk Query Examples

### Extract Fields from XML

Extract fields from XML raw data. **Example XML:**

```xml
<request><id>12345</id><name>test 2 name</name></request>
```

**Splunk query** to extract the `id` field:

```
index=dockertest | rex field=_raw "<id>(?<id>[^<]+)</id>" | table id
```

## Project Structure

```
spring_splunk/
├── Dockerfile
├── Jenkinsfile
├── pom.xml
├── README.md
└── src/
    └── main/
        ├── java/
        │   └── DockerTestApplication.java
        └── resources/
            └── log4j2.xml
```

## Configuration

- **Logging Configuration:** `src/main/resources/log4j2.xml`
- **Docker Configuration:** `Dockerfile`
- **CI/CD Configuration:** `Jenkinsfile`

## License

[Specify your license here]

## Contributing

[Add contribution guidelines if applicable]

