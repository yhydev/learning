package priv.yanyang.example.mybatis;

import org.junit.Test;

import static org.junit.Assert.*;

public class MybatisTest {



    @Test
    public void testOpenSession(){
        Mybatis.sqlsessionFactory.openSession();
    }

}