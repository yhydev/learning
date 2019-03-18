package priv.yanyang.example.springboot.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Accessors
public class User implements Serializable{

    private String userId;

}
