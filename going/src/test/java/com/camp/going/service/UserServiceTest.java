package com.camp.going.service;

import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.request.UserLoginRequestDTO;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static com.camp.going.service.LoginResult.SUCCESS;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserServiceTest {

    @Autowired
    UserService userService;

    @Test
    @DisplayName("회원정보 전달하면 비밀번호 암호화 되서 DB로 전달")
    void joinTest() {
        // given
        SignUpRequestDTO dto = SignUpRequestDTO.builder()
                .email("abc1234@naver.com")
                .password("abc1111!")
                .phone_number("010-1234-5678")
                .build();

        // when
        userService.join(dto);

        // then

    }

    @Test
    @DisplayName("로그인 시도 결과를 상황별로 확인")
    void loginTest() {
        // given
        UserLoginRequestDTO dto = UserLoginRequestDTO.builder()
                .email("abc1234@naver.com")
                .password("abc1111!")
                .build();

        // when
        LoginResult result = userService.authenticate(dto);


        // then
        assertEquals(SUCCESS, result);

    }

}