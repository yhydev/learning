package priv.yanyang.example.aop;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class LogHandler {
    
    public void after(){
        System.out.println("after.... ");
    }
    
}
