package com.camp.going.service;

import com.camp.going.dto.request.AutoLoginDTO;
import com.camp.going.dto.request.LoginRequestDTO;
import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.entity.User;
import com.camp.going.mapper.UserMapper;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

import static com.camp.going.service.LoginResult.*;
import static com.camp.going.util.LoginUtils.*;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;
    private final PasswordEncoder encoder;
    public LoginResult authenticate(LoginRequestDTO dto,
                                    HttpSession session,
                                    HttpServletResponse response) {

        User foundUser = userMapper.findUser(dto.getEmail());

        // 회원 가입을 안한 상태
        if(foundUser == null){
            System.out.println(dto.getEmail() + "(은)는 없는 아이디!");
            return NO_ACC;
        }

        // 비밀번호 일치 검사
        String inputPassword = dto.getPassword(); // 사용자 입력 패스워드
        String realPassword = foundUser.getPassword(); // 실제 패스워드

        if (!encoder.matches(inputPassword, realPassword)) {
            System.out.println("비밀번호가 다르다!");
            return NO_PW;
        }

        // 자동 로그인 처리
        if(dto.isAutoLogin()){
            // 1. 자동 로그인 쿠키 생성 - 쿠키 안에 절대 중복되지 않는 값을 저장. (브라우저 세션 아이디)
            Cookie autoLoginCookie = new Cookie(AUTO_LOGIN_COOKIE, session.getId());

            // 2. 쿠키 설정 - 사용경로, 수명....
            int limitTime = 60 * 60 * 24 * 90; // 자동 로그인 유지 시간
            autoLoginCookie.setPath("/");
            autoLoginCookie.setMaxAge(limitTime);

            // 3. 쿠키를 클라이언트에게 전송하기 위해 응답 객체에 태우기
            response.addCookie(autoLoginCookie);

            // 4. DB에도 쿠키에 관련된 값들(랜덤한 세션아이디, 자동로그인 만료시간)을 갱신.
            userMapper.saveAutoLogin(AutoLoginDTO.builder()
                    .sessionId(session.getId())
                    .limitTime(LocalDateTime.now().plusDays(90))
                    .email(dto.getEmail())
                    .build()
            );
        }

        System.out.println(dto.getEmail() + "님 로그인 성공!");
        return SUCCESS;
    }

    public void join(SignUpRequestDTO dto){

        userMapper.save(dto.toEntity(encoder));

    }

    public boolean checkDuplicateValue(String type, String keyword) {
        return userMapper.isDuplicate(type, keyword);
    }

}
