
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.Logger;

public class DockerTestApplication {
	
	static Logger logger =  (Logger) LogManager.getRootLogger();
	
	public static void main(String[] args) {
		System.out.println("dockertest is running...");
		logger.info("dockertest log");
	}

}
