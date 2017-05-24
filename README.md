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

## Deploy to Azure Web App
Rename the `.war` file in `target` folder to `ROOT.war` and upload it to your Azure Web App through Git or FTP.
