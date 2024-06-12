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
	     	steps{
	     	    script{		 	   
					app = docker.build("dockertest", "-f Dockerfile .")			 		 	    
		 		}		     	    
	     	}	 		      
    	}
    	
    	
    }
}