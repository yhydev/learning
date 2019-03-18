package priv.yanyang.example.mybatis.mapper;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.junit.Test;
import priv.yanyang.example.mybatis.Mybatis;
import priv.yanyang.example.mybatis.model.User;

import static org.junit.Assert.*;

public class UserMapperTest {

    Logger logger = Logger.getLogger(UserMapperTest.class);
    @Test
    public void selectOne() {

        SqlSession sqlSession = Mybatis.sqlsessionFactory.openSession();
        //插入测试数据
        User user = new User();
        user.setName("java");
        sqlSession.insert("insertOne",user);
        //查询测试数据
        user = sqlSession.selectOne("priv.yanyang.example.mybatis.mapper.UserMapper.selectOneByUser",user);
        logger.info("selectOneByUser:");
        logger.info(user);
        sqlSession.commit();

    }
}