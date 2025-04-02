pipeline{
    agent{
        docker { image 'nginx: 1.4.12'}
    }
    options{
        timeout { time: 1, unit: seconds}
    }
    stages{
        stage{
            echo 'hello world'
        }

    }
}