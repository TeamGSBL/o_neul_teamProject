package com.gsbl.oneul.user;

import com.gsbl.oneul.model.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    int join(UserVO vo);
    UserVO login(UserVO vo);
    int updUser(UserVO vo);

}
