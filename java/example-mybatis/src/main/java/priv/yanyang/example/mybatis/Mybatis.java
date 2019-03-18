package priv.yanyang.example.mybatis;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.PropertyConfigurator;

import java.io.InputStream;
import java.util.Properties;

public class Mybatis {
    public final static SqlSessionFactory sqlsessionFactory;
    static {
        InputStream stream = Mybatis.class.getResourceAsStream("/mybatis-config.xml");
        sqlsessionFactory = new SqlSessionFactoryBuilder().build(stream);
    }

    static {
        InputStream stream = Mybatis.class.getResourceAsStream("/log4j.properties");
        PropertyConfigurator.configure(stream);
    }
}
