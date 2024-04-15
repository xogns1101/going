package com.camp.going.mapper;

import com.camp.going.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMapperTest {

    @Autowired
    UserMapper userMapper;

    @Test
    @DisplayName("회원 가입에 성공할것")
    void saveTest() {
        // given

        // when
        User user = User.builder()
                .email("aaa1111@naver.com")
                .password("aaa1111")
                .phoneNumber("010-1454-5378")
                .build();
        userMapper.save(user);



        // then
    }


    @Test
    @DisplayName("이메일 중복 확인")
    void duplicateTest() {
        // given
        String email = "abc1234@naver.com";

        // when
        boolean emailFlag = userMapper.isDuplicate("email", email);

        // then
        assertTrue(emailFlag);
    }



}