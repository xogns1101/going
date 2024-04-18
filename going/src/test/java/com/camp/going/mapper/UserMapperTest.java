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
                .email("bbb1234@naver.com")
                .password("bbb1234!")
                .phoneNumber("010-8954-1342")
                .name("배라이언")
                .build();
        userMapper.save(user);



        // then
    }

    @Test
    @DisplayName("이메일이 aaa1111@naver.com을 조회 하면 그 이름은 김춘식이여야 한다")
    void findUserTest() {
        // given
        String email = "aaa1111@naver.com";
        // when
        User user = userMapper.findUser(email);
        // then
        assertEquals(user.getName(), "김춘식");
    }

    @Test
    @DisplayName("이메일이 aaa1111@naver.com일 경우 중복확인 결과값이 true여야 한다.")
    void duplicateTest() {
        // given
        String email = "aaa1111@naver.com";
        // when
        boolean emailFlag = userMapper.isisDuplicate("keyword", email);
        // then
        assertTrue(emailFlag);
    }

}