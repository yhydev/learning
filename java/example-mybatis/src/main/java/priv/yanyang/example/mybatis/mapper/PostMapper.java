package priv.yanyang.example.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import priv.yanyang.example.mybatis.model.Post;
import priv.yanyang.example.mybatis.viewmodel.SimplePost;

import java.util.List;
public interface PostMapper {

    List<SimplePost> selectViewSimplePost(String userId);

    int insertPost(Post post);

}
