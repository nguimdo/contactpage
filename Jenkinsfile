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
               sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible_hosts', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/deployment', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)]) 
            }
        }
    
}
}
         

