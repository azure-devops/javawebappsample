node {
  stage('init') {
    checkout scm
  }
  
  stage('build') {
    sh 'mvn clean package'
  }
  
  stage('deploy') {
    def resourceGroup = 'tomcatTesting123'
    def webAppName = 'tomcatTesting123'
    sh 'mv target/*.war target/ROOT.war'
    azureWebAppPublish azureCredentialsId: 'mySp', publishType: 'file',
                       resourceGroup: resourceGroup, appName: webAppName,
                       filePath: '*.war', sourceDirectory: 'target', targetDirectory: 'webapps'
  }
}
