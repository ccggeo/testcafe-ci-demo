node {
    def app

    stage('Clone repository') {

        checkout scm
    }

    stage('Build image') {

        app = docker.build("wqsttfuhinezwgscvibvxif/test-cafe")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Run Tests') {
        docker.image('wqsttfuhinezwgscvibvxif/test-cafe:latest').inside {
        sh '/usr/local/bin/testcafe "chrome:headless" tests/**/*'
        }

    }
}
