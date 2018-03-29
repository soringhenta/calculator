pipeline {
  agent any
  stages {
    stage("Compile") {
      steps {
        sh "./gradlew compileJava"
      }
   }
   

stage("Package") {
steps {
sh "./gradlew build"
}
}
stage("Docker build") {
steps {
sh "docker build -t leszko/calculator ."
}
}

stage("Deploy to staging") {
steps {
sh "docker run -d --rm -p 8080:8080 --name calculator leszko/calculator"
}
}

stage("Acceptance test") {
steps {
sh "./acceptance_test.sh"
}
}

post {
always {
sh "docker stop calculator"
}
}


 } 
}

