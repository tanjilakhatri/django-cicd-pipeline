pipeline {

    agent any

    environment {
        SECRET_KEY = "django-insecure-0kw8-%x$9k^ka_@v3uwcynkv+m#++1k8zj&trpw1%g&qv9(y2v"
        DEBUG = "True"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Create Virtual Environment') {
            steps {
                sh '''
                python3 -m venv venv
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Django Check') {
            steps {
                sh '''
                . venv/bin/activate
                python manage.py check
                '''
            }
        }

        stage('Migration') {
            steps {
                sh '''
                . venv/bin/activate
                python manage.py migrate --noinput
                '''
            }
        }

        stage('Testing') {
            steps {
                sh '''
                . venv/bin/activate
                python manage.py test
                '''
            }
        }

        stage('Collect Static') {
            steps {
                sh '''
                . venv/bin/activate
                python manage.py collectstatic --noinput
                '''
            }
        }

    }
}
