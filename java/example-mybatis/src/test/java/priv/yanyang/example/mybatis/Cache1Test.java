package priv.yanyang.example.mybatis;

import com.mysql.cj.Session;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import priv.yanyang.example.mybatis.model.User;
import sun.rmi.runtime.Log;


/**
 * 一级缓存测试
 */
public class Cache1Test {

    Logger logger = org.apache.log4j.Logger.getLogger(Cache1Test.class);
    User user;

    @Before
    public void before(){
        user = new User();
        user.setName("C/C++");
        SqlSession sqlSession = Mybatis.sqlsessionFactory.openSession();
        sqlSession.insert("insertOne",user);
        sqlSession.commit();
        sqlSession.close();

    }

    /**
     * 有效的一级缓存
     */
    @Test
    public void effectiveCache(){
        SqlSession sqlSession = Mybatis.sqlsessionFactory.openSession();
        User result;
        logger.info("invalidCache()");
        //selectOneByUser 查询属性flushCache 则清空缓存
        result = sqlSession.selectOne("selectOneById", user.getId());
        logger.info("查询结果：" + result);
        result = sqlSession.selectOne("selectOneById",user.getId());
        logger.info("查询结果：" + result);
    }

    /**
     * 无效的一级缓存
     */
    @Test
    public void invalidCache(){
        SqlSession sqlSession1 = Mybatis.sqlsessionFactory.openSession();
        SqlSession sqlSession2 = Mybatis.sqlsessionFactory.openSession();

        //不同session导致的缓存失效
        logger.info("invalidCache()");
        User result = sqlSession1.selectOne("selectOneById",user.getId());
        logger.info("查询结果：" + result);
        result = sqlSession2.selectOne("selectOneById",user.getId());
        logger.info("查询结果：" + result);

        //插入数据后，导致缓存清空
        sqlSession2.insert("insertOne",user);
        result = sqlSession2.selectOne("selectOneById", user.getId());
        logger.info("查询结果：" + result);
        sqlSession2.commit();
    }
}
