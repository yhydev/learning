package priv.yanyang.example.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import priv.yanyang.example.aop.service.UserService;

public class App {


    public static void main(String[] args) {

        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-context.xml");
        UserService userService = ac.getBean(UserService.class);
        userService.login();
    }


}
