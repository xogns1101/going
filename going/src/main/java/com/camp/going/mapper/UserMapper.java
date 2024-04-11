package com.camp.going.mapper;

import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    void save(User user);

}
