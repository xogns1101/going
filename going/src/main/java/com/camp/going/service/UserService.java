package com.camp.going.service;

import com.camp.going.dto.request.AutoLoginDTO;
import com.camp.going.dto.request.KakaoSignUpRequestDTO;
import com.camp.going.dto.request.LoginRequestDTO;
import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.entity.User;
import com.camp.going.mapper.UserMapper;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.WebUtils;

import java.time.LocalDateTime;
import java.util.Map;

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

        User oneUser = userMapper.findUser(dto.getEmail());

        log.info("이메일 확인 : {}", oneUser.getEmail());

        // 회원 가입을 안한 상태
        if(oneUser == null){
            System.out.println(dto.getEmail() + "(은)는 없는 아이디!");
            return NO_EMAIL;
        }

        // 비밀번호 일치 검사
        String inputPassword = dto.getPassword(); // 사용자 입력 패스워드
        String realPassword = oneUser.getPassword(); // 실제 패스워드

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

    // 네이버
    public void join(SignUpRequestDTO dto){

        userMapper.save(dto.toEntity(encoder));

    }


    // 카카오
    public void joins(KakaoSignUpRequestDTO dto, String savePath){

        userMapper.save(dto.toEntity(encoder, savePath));

    }

    public boolean checkDuplicateValue(String type, String keyword) {
        return userMapper.isDuplicate(type, keyword);
    }

    public void maintainLoginState(HttpSession session, String email) {

        log.info("이메일: {}", email);

        // 현재 로그인한 회원의 모든 정보 조회
        User oneUser = userMapper.findUser(email.trim());

        // DB 데이터를 보여줄 것만 정제
        LoginUserResponseDTO dto = LoginUserResponseDTO.builder()
                .email(oneUser.getEmail())
                .phoneNumber(oneUser.getPhoneNumber())
                .name(oneUser.getName())
                .auth(oneUser.getAuth())
                .loginMethod(oneUser.getLoginMethod().toString())
                .build();

        // 세션에 로그인한 회원 정보를 저장
        session.setAttribute(LOGIN_KEY, dto);
        // 세션 수명 설정
        session.setMaxInactiveInterval(60 * 60); // 1시간



    }

    public void autoLoginClear(HttpServletRequest request, HttpServletResponse response) {

        // 1. 자동 로그인 쿠키를 가져온다.
        Cookie c = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);

        // 2. 쿠키를 삭제한다.
        // -> 쿠키의 수명을 0초로 설정하여 다시 클라이언트에 전송 -> 자동 소멸
        if (c != null) {
            c.setMaxAge(0);
            c.setPath("/");
            response.addCookie(c);

            // 3. 데이터베이스에서도 세션아이디와 만료시간을 제거하자.
            userMapper.saveAutoLogin(
                    AutoLoginDTO.builder()
                            .sessionId("none") // 세션아이디 지우기
                            .limitTime(LocalDateTime.now()) // 로그아웃한 현재 날짜
                            .email(getCurrentLoginMemberAccount(request.getSession())) // 로그인 중이었던 사용자 아이디.
                            .build()
            );

        }


    }


    public void kakaoLogout(LoginUserResponseDTO dto, HttpSession session) {

        String requestUri = "https://kapi.kakao.com/v1/user/logout";

        String accessToken = (String) session.getAttribute("access_token");

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
        params.add("target_id_type", "user_id");
        params.add("target_id", dto.getEmail());

        RestTemplate template = new RestTemplate();
        ResponseEntity<Map> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(params, headers),
                Map.class
        );

        Map<String, Object> responseJSON = (Map<String, Object>) responseEntity.getBody();
        log.info("응답 데이터: {}", responseJSON); // 로그아웃하는 사용자의 id
    }


    public User getFindUser(String email) {

        User user = userMapper.findUser(email);

        return user;

    }
}

