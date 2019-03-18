package priv.example.zookeeper;

import org.apache.log4j.PropertyConfigurator;
import org.junit.Before;

import java.io.IOException;
import java.io.InputStream;

public class Init{

    @Before
    public void log(){
        InputStream is = this.getClass().getResourceAsStream("/log4j.properties");
        PropertyConfigurator.configure(is);
        try {
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
