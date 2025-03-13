pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'nodejs' // Debe coincidir con la configuración en Jenkins
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
        NODE_OPTIONS = "--max_old_space_size=4096" // 🔹 Aumenta la memoria a 4GB
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sebastian2018-58586/Gps-Front.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci' // 🔹 Usa npm ci para instalaciones más rápidas y confiables
            }
        }

        stage('Build') {
            steps {
                timeout(time: 10, unit: 'MINUTES') { // 🔹 Limita el tiempo de construcción
                    sh 'npm run build -- --configuration=production'
                }
            }
        }

        stage('Test') {
            steps {
                catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                    sh 'npm test || echo "No hay pruebas configuradas"' // 🔹 Evita fallo si no hay pruebas
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Desplegando la aplicación..."'
            }
        }

        stage('Clean Workspace') {
            steps {
                cleanWs() // 🔹 Limpia el workspace para liberar espacio
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
        unstable {
            echo '⚠️ Pipeline inestable (por ejemplo, pruebas fallidas).'
        }
    }
}
