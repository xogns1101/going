package com.camp.going.user;

import com.camp.going.service.KakaoLoginService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class KakaoLoginController {

    private final KakaoLoginService kakaoLoginService;

    @Value("${sns.kakao.app-key}")
    private String kakaoAppkey;

    @Value("${sns.kakao.redirect-uri}")
    private String kakaoRedirectUri;

    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String uri = "https://kauth.kakao.com/oauth/authorize";
        uri += "?client_id=" + kakaoAppkey;
        uri += "&redirect_uri=" + kakaoRedirectUri;
        uri += "&response_type=code";

        return "redirect:" + uri;
    }

    // 인가 코드 받기
    @GetMapping("/auth/kakao")
    public  String snsKaKao(String code, HttpSession session) {
        log.info("카카오 로그인 인가 코드: {}", code);

        // 토큰 발급 요청
        Map<String, String> params = new HashMap<>();
        params.put("appKey", kakaoAppkey);
        params.put("redirect", kakaoRedirectUri);
        params.put("code", code);

        kakaoLoginService.kakaoLogin(params, session);

        return "redirect:/";
    }

}
