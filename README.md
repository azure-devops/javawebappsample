# A Simple Java Web App for Azure

## Build
```shell
mvn package
```

## Run Locally
```shell
mvn jetty:run
```
To run in a different port
```shell
mvn jetty:run -Djetty.port=<your port>
```

## Debug Locally
```shell
set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000,suspend=n
mvn jetty:run
```

## Deploy to Azure Web App using FTP
Rename the `.war` file in `target` folder to `ROOT.war` and upload it to your Azure Web App through Git or FTP.

## Containerize Your Web App
1. Build a docker image using `Dockerfile`:
   ```
   docker build -t calculator .
   ```
2. Run docker image locally
   ```
   docker run --rm -p 8080:8080 calculator
   ```
3. Then you can access the web app at http://localhost:8080 in browser

## Deploy to Azure Web App using Container Image
1. Create a Container Registry on Azure
2. Push your local image to ACR:
   ```
   docker login -u <client id> -p <client secret> <your ACR server>
   docker tag calculator <your ACR server>/calculator
   docker push <your ACR server>/calculator
   ```
3. Create a Web App in Linux on Azure
4. In Docker Container settings of Web App, fill in image name, server URL, username and password of your ACR.
5. Save the changes and you'll be able to access the web app in a few seconds.

## Setup Continous Integration with Azure using Jenkins
1. Go to Settings -> Integration & services, click Add service, choose Jenkins (GitHub plugin), fill in Jenkins hook url with `http://<your jenkins server>/github-webhook/`
2. Make sure your Jenkins has the following components installed:
   * JDK
   * Maven
   * Docker
   
   And the following plugins installed:
   * Azure credentials
   * Docker pipeline
   * Credentials binding
4. To deploy using FTP, create a Jenkins pipeline with `Jenkinsfile` as pipeline file.
5. To deploy using container, create a Jenkins pipeline with `Jenkinsfile2` as pipeline file.
