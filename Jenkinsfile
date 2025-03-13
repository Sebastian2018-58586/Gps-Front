pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'nodejs' // Asegúrate de que el nombre coincida con la configuración de Node.js en Jenkins
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sebastian2018-58586/Gps-Front.git' // Clona tu repositorio
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install' // Instala las dependencias de npm
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build -- --prod' // Construye el proyecto Angular en modo producción
            }
        }

        stage('Test') {
            steps {
                sh 'npm test' // Ejecuta las pruebas unitarias (si tienes configuradas)
            }
        }

        stage('Deploy') {
            steps {
                // Aquí puedes agregar los pasos para desplegar tu aplicación
                // Por ejemplo, desplegar en un servidor o en un servicio como Firebase, Netlify, etc.
                sh 'echo "Desplegando la aplicación..."'
            }
        }
    }

    post {
        success {
            echo 'Pipeline ejecutado con éxito!'
        }
        failure {
            echo 'Pipeline falló!'
        }
    }
}
