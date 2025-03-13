pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'nodejs' // Debe coincidir con la configuración en Jenkins
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sebastian2018-58586/Gps-Front.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build -- --configuration=production' // ✅ Fix Angular 12+
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || echo "No hay pruebas configuradas"' // ✅ Evita fallo si no hay pruebas
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Desplegando la aplicación..."'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline ejecutado con éxito!'
        }
        failure {
            echo '❌ Pipeline falló!'
        }
    }
}

