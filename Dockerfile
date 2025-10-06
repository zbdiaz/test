pipeline {
    agent none  // No usa un agente por defecto, cada stage define su propio contenedor Docker

    stages {
        stage('Checkout') {
            agent {
                docker { image 'php:8.2-cli' }  // Usar imagen PHP para esta etapa
            }
            steps {
                // Verificar la versión de PHP
                sh 'php --version'
            }
        }

        stage('Compilation') {
            agent {
                docker { image 'php:8.2-cli' }
            }
            steps {
                // Comando de compilación ficticio (reemplazar con tu proceso real)
                sh 'echo "Compilando..."'
            }
        }

        stage('Build') {
            agent {
                docker { image 'php:8.2-cli' }
            }
            steps {
                // Construcción de la imagen Docker (puedes modificar según tu flujo)
                sh 'echo "docker build -t my-php-app ."'
            }
        }

        stage('Deploy') {
            agent {
                docker { image 'php:8.2-cli' }
            }
            steps {
                // Comando para desplegar la app (puedes modificar según tu flujo)
                sh 'echo "docker run my-php-app ."'
            }
        }
    }
}
