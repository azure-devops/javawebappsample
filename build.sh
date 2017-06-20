mvn clean package
mkdir -p webapps
cp target/calculator*.war webapps/ROOT.war
