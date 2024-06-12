pipeline {
    agent any
    stages {
        stage('Initial stage') {
        	steps {
	            echo 'Initial stage'
	        }
           
        }
         stage('Build image') {
	        /* This builds the actual image; synonymous to
	         * docker build on the command line */
		 	script{
		 	    steps{
			    app = docker.build("dockertest")			    
				}	 		 	    
		 	}

			      
    	}
    	
    	stage('Test image') {
	        /* Ideally, we would run a test framework against our image.
	         * For this example, we're using a Volkswagen-type approach ;-) */
			steps{
				scripts{
				    app.inside {
		            	sh 'echo "Tests passed"'
		        	}				    
				}			     		    
			}	       
    	}
    }
}