package priv.yanyang.example.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.swing.*;

@RestController
@EnableAutoConfiguration
public class App {

    @RequestMapping("/")
    public String index(){
        return "index";
    }


    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
