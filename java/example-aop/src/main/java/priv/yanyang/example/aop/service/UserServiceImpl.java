package priv.yanyang.example.aop.service;

public class UserServiceImpl implements UserService {
    @Override
    public Object login() {
        System.out.println("UserServiceImpl.login");
        return null;
    }
}
