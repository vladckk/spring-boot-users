package gomel.iba.by;

import org.apache.log4j.BasicConfigurator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class UsersApplication {

    public static void main(String[] args) {
        BasicConfigurator.configure();
        SpringApplication.run(UsersApplication.class, args);
    }
}
