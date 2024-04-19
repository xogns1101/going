package com.camp.going.mapper;

import com.camp.going.entity.MyPage;
import com.camp.going.entity.Review;
import com.camp.going.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MyPageMapperTest {

    @Autowired
    MyPageMapper myPageMapper;

    @Test
    @DisplayName("이메일이 bbb1234@naver.com인 사람 이름을 홍길동으로 변경하기")
    void modifyNameTest() {
        // given
        String email = "bbb1234@naver.com";
        // when
        User hong = User.builder()
                .name("홍길동")
                .email(email)
                .build();

        myPageMapper.modifyName(hong);
        // then
    }

    @Test
    @DisplayName("이메일이 bbb1234@naver.com인 사람 전화번호 010-0000-0000로 변경하기")
    void modifyPhoneNumberTest() {
        // given
        String email = "bbb1234@naver.com";
        // when
        User hong = User.builder()
                .email(email)
                .phoneNumber("010-0000-0000")
                .build();

        myPageMapper.modifyPhoneNumber(hong);
        // then
    }

    @Test
    @DisplayName("이메일이 bbb1234@naver.com인 사람 비밀번호 abc12345678!로 변경하기")
    void modifyPasswordTest() {
        // given
        String email = "bbb1234@naver.com";
        // when
        User hong = User.builder()
                .email(email)
                .password("abc12345678!")
                .build();

        myPageMapper.modifyPassword(hong);
        // then
    }
    
    @Test
    @DisplayName("이메일이 bbb1234@naver.com인 사람의 예약 내용 확인하기")
    void confirmReservationTest() {
        // given
        String email = "bbb1234@naver.com";
        // when
        List<MyPage> myPages = myPageMapper.confirmReservation(email);
        // then
        assertEquals(2, myPages.size());

    }

}