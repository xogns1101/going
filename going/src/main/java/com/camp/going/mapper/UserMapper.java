package com.camp.going.mapper;

import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    void save(User user);


    User findUser(String email);
    /**
     * 중복 체크(account, email) 기능
     * @param type - 중복을 검사할 내용 (account, email)
     * @param keyword - 중복 검사 입력값 (ex: abc1234@naver.com...)
     * @return 중복이면 true, 중복이 아니면 false
     */
    boolean isDuplicate(@Param("type") String type, @Param("keyword") String keyword);


}
