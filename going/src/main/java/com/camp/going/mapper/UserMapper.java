package com.camp.going.mapper;

import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    // 회원 가입
    void save(User user);

    // 회원 정보 단일 조회
    User findUser(String email);
    
    // 이메일 (아이디) 중복확인
    // @Param("type") String type (대기)
    boolean isisDuplicate(@Param("keyword") String keyword, @Param("email") String email);

}
