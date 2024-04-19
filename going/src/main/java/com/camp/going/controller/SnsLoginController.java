package com.camp.going.controller;

import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.service.SnsLoginService;
import com.camp.going.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.camp.going.util.LoginUtils.LOGIN_KEY;
import static com.camp.going.util.LoginUtils.isAutoLogin;

@Controller
@Slf4j
@RequiredArgsConstructor
public class SnsLoginController {

    private final SnsLoginService snsLoginService;
    private final UserService userService;

    @Value("${sns.kakao.app-key}")
    private String kakaoAppKey;

    @Value("${sns.kakao.redirect-uri}")
    private String kakaoRedirectUri;

    @Value("${sns.naver.client-id}")
    private String naverClientId;

    @Value("${sns.naver.client-secret}")
    private String naverClientSecret;

    @Value("${sns.naver.redirect-uri}")
    private String naverCallBack;

    @Value("${sns.naver.state}")
    private String naverState;



    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String uri = "https://kauth.kakao.com/oauth/authorize";
        uri += "?client_id=" + kakaoAppKey;
        uri += "&redirect_uri=" + kakaoRedirectUri;
        uri += "&response_type=code";

        return "redirect:" + uri;
    }

    // 인가 코드 받기
    @GetMapping("/auth/kakao")
    public String snsKakao(String code, HttpSession session) {
        log.info("카카오 로그인 인가 코드: {}", code);

        // 인가 코드를 가지고 카카오 인증 서버에 토큰 발급 요청을 보내자 (server to server 통신)
        // 서비스에게 시킬 것임.
        Map<String, String> params = new HashMap<>();
        params.put("appKey", kakaoAppKey);
        params.put("redirect", kakaoRedirectUri);
        params.put("code", code);

        snsLoginService.kakaoLogin(params, session);

        // 로그인 처리가 모두 완료되면 홈 화면으로 보내줍니다.
        return "redirect:/";
    }

    // 네이버 로그인 구현
    @GetMapping("/naver/login")
    public String naverLogin(){

        String uri = "https://nid.naver.com/oauth2.0/authorize";

        uri += "?response_type=code";
        uri += "&client_id=" + naverClientId;
        uri += "&state=" + naverState;
        uri += "&redirect_uri=" + naverCallBack;

        return "redirect:" + uri;

    }

    @GetMapping("/naver/auth")
    public String snsKakao(HttpSession session, String code, String state) {
        log.info("네이버 인가 코드: {}", code);

        // 인가 코드를 가지고 카카오 인증 서버에 토큰 발급 요청을 보내자 (server to server 통신)
        // 서비스에게 시킬 것임.
        Map<String, String> params = new HashMap<>();
        params.put("grant_type", "authorization_code");
        params.put("clientId", naverClientId);
        params.put("clientSecret", naverClientSecret);
        params.put("code", code);
        params.put("state", state);


        snsLoginService.naverLogin(params, session);

        // 로그인 처리가 모두 완료되면 홈 화면으로 보내줍니다.
        return "redirect:/jq/kakaopay";
    }

    // 네이버 로그아웃 요청 처리
    @GetMapping("/naver/sign-out")
    public String naverSignOut(HttpSession session,
                               HttpServletRequest request,
                               HttpServletResponse response){

        log.info("/naver/sign-out: GET!");






        return null;
    }


}
