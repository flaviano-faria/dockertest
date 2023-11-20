import java.util.logging.Logger;

import org.apache.logging.log4j.LogManager;

public class DockerTestApplication {
	
	static Logger logger = (java.util.logging.Logger) LogManager.getRootLogger();
	
	public static void main(String[] args) {
		System.out.println("dockertest is running...");
		logger.info("dockertest log");
	}

}
