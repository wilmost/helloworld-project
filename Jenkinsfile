pipeline {
  agent  any
        
  stages{
    stage('Download_Frontend'){
      steps{
        git branch: 'master', url:'https://bitbucket.org/bravo-devops-test/helloworld.git'
           }
        }
    stage('Build'){
        steps{
                sh 'npm install'
                sh 'npm run build:dev'
                stash name: 'helloworld', includes: '**/*'
                }
    }
   
    stage(build_docker_image){
      agent{ label 'docker-agent-1'}
      steps{
        git branch: 'master', url:'https://github.com/wilmost/demo-repo.git'
        unstash 'helloworld'
       script{
           def helloworld_image = docker.build("helloworld:${env.BUILD_ID}","./Dockerfiles/helloworld-app") 
              }
      }
      
      
    }     
  }
}
