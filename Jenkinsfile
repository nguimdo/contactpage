pipeline {
    agent any
    triggers {
  pollSCM '* * * * *'
}
    tools {
        maven 'M2_HOME'
    }

    stages {
        stage('build') {
            steps {
                echo 'Hello build'
                sh 'mvn clean'
                sh 'mvn install'
                sh 'mvn package'
            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
      stage ('build and publish image') {
      steps {
        script {
          checkout scm
          docker.withRegistry('', 'DockerID') {
          def customImage = docker.build("francinenguimdo/contactpage-pipeline:${env.BUILD_ID}")
          def customImage1 = docker.build("francinenguimdo/contactpage-pipeline")
          customImage.push()
          customImage1.push()
          }
    }

    }
}
        stage ( 'deployment trigger'){
            steps {
                build 'hol-pipeline-CD'
            }
        }
    
}
}
         

