package priv.yanyang.example.mybatis.mapper;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import priv.yanyang.example.mybatis.Mybatis;
import priv.yanyang.example.mybatis.model.Post;
import priv.yanyang.example.mybatis.model.User;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class PostMapperTest {

    Post post;
    User user;

    Logger logger = Logger.getLogger(PostMapper.class);

    @Before
    public void before(){
        user = new User();
        user.setName("testuser");
        SqlSession sqlSession = Mybatis.sqlsessionFactory.openSession();
        sqlSession.insert("userMapper.insertOne", user);

        post = new Post();

        post.setTag(1);
        post.setCreateTime((int) (System.currentTimeMillis()/1000));
        post.setTitle("test title");
        post.setContent("test content");
        post.setAuthorId(user.getId());


        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        postMapper.insertPost(post);
        sqlSession.commit();

    }


    @Test
    public void selectViewSimplePost() {
        SqlSession sqlSession = Mybatis.sqlsessionFactory.openSession();
        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
        List posts = postMapper.selectViewSimplePost(user.getId());
        logger.info("selectViewSimplePost()");
        logger.info(Arrays.toString(posts.toArray()));
    }

    @Test
    public void insertPost() {
    }
}