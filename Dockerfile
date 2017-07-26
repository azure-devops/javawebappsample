FROM tomcat
MAINTAINER <yourName>

RUN rm -rf $CATALINA_HOME/webapps/ROOT
COPY target/calculator-1.0.war $CATALINA_HOME/webapps/ROOT.war
