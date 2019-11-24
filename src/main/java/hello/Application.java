package hello;

import java.lang.management.*;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
public class Application {

    @RequestMapping("/")
    public String home() {
        return "Hello Docker " + ManagementFactory.getRuntimeMXBean().getName();
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
