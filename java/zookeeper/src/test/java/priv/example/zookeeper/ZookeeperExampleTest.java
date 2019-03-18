package priv.example.zookeeper;

import com.sun.org.apache.xerces.internal.dom.ChildNode;
import org.apache.log4j.Logger;
import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;
import org.junit.Before;
import org.junit.Test;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.CountDownLatch;


public class ZookeeperExampleTest extends Init {




    Logger logger = Logger.getLogger(ZookeeperExampleTest.class);
    ZooKeeper zooKeeper;
    String conStr = "debian";
    int timeout = 5000;


    String ZNode = "/kafka";
    byte[] Data = ("kafka info " + Math.random()).getBytes();

    String ChildZNode= ZNode + "/server1";
    byte[] ChildData = "1.1.1.1".getBytes();

    CountDownLatch connectSign = new CountDownLatch(1);

    Watcher watcher = new Watcher() {
        @Override
        public void process(WatchedEvent event) {
            logger.info("Method\tZookeeperExampleTest.process");
            if(event.getState() == Event.KeeperState.SyncConnected){
                logger.info("event status: SyncConnected");
                connectSign.countDown();
            }else{
                logger.info("event = " + event);
            }
        }
    };


    /**
     * 连接到zk 服务，并初始化 <b>zooKeeper</b>
     */
    @Before
    public void connect(){
        logger.info("conStr = " + conStr);
        try {
            zooKeeper = new ZooKeeper(conStr,timeout,watcher);
            connectSign.await();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    /**
     * 1. 创建ZNode, 如果存在则删除, 然后再创建。
     * 2. 创建ChildZNode
     */
    @Test
    public void test(){
        logger.info("Method\tZookeeperExampleTest.");
        Stat stat;
        try {

            if ((stat = zooKeeper.exists(ZNode,true)) == null){
                logger.info(ZNode + " ZNode not exists");
                zooKeeper.create(ZNode,Data, ZooDefs.Ids.OPEN_ACL_UNSAFE,CreateMode.PERSISTENT);
            }else{
                logger.info(ZNode + " ZNode exists");
                zooKeeper.delete(ZNode,stat.getVersion());
                logger.info("delete ZNode " + ZNode);


            }
            logger.info(" Znode " + ZNode);
            zooKeeper.create(ZNode,Data, ZooDefs.Ids.OPEN_ACL_UNSAFE,CreateMode.PERSISTENT);

            byte[] data = zooKeeper.getData(ZNode,true,stat);

            logger.info("new String(data) = " + new String(data));
            logger.info("stat = " + stat);


            zooKeeper.create(ChildZNode,ChildData, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
            logger.info(String.format("crate ZNode [%s] success", ChildZNode));


        } catch (KeeperException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }




}