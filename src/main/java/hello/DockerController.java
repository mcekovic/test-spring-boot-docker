package hello;

import org.springframework.context.annotation.*;
import org.springframework.web.bind.annotation.*;

@RestController
@Profile("docker")
public class DockerController {

    @RequestMapping("/docker")
    public String docker() {
        return "Docker Exclusive";
    }
}
