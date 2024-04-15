package com.camp.going.service;

import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.response.KakaoUserResponseDTO;
import com.camp.going.entity.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class KakaoLoginService {

    private final UserService userService;



    // 카카오 로그인
    public void kakaoLogin(Map<String, String> params, HttpSession session) {

        String accessToken = getKakaoAccessToken(params);
        session.setAttribute("access_token", accessToken);
        log.info("access_token: {}", accessToken);

        KakaoUserResponseDTO dto = getKakaoUserInfo(accessToken);

        String email = dto.getAccount().getEmail();
        log.info("이메일: {}", email);

        if (!userService.checkDuplicateValue("email", email)) {
            // 한번도 카카오 로그인을 한 적이 없다면 회원가입이 들어간다.
            userService.join(
                    SignUpRequestDTO.builder()
                            //       .account(String.valueOf(dto.getId()))
                            .password("0000")
                            //       .name(dto.getProperties().getNickname())
                            .email(email)
                            .loginMethod(User.LoginMethod.KAKAO)
                            .build()
                    //  dto.getProperties().getProfileImage()
            );

        }

        // 이부분 수정나면 account 추가해서 바꾸기 Access 토큰 영상 1시 7분 25초
        userService.maintainLoginState(session, email);

    }

    private KakaoUserResponseDTO getKakaoUserInfo(String accessToken) {

        String requestUri = "https://kapi.kakao.com/v2/user/me";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer" + accessToken);
        headers.add("Contetent-type", "application/x-www-form-urlencoded;charset=utf-8");

        RestTemplate template = new RestTemplate();
        ResponseEntity<KakaoUserResponseDTO> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(headers),
                KakaoUserResponseDTO.class
        );

        KakaoUserResponseDTO responseJSON = responseEntity.getBody();
        log.info("응답 데이터 결과: {}", responseJSON);

        return responseJSON;

    }

    // 토큰 발급
    private String getKakaoAccessToken(Map<String, String> requestParam) {

        String requestUri = "https://kauth.kakao.com/oauth/token";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", requestParam.get("appKey"));
        params.add("redirect_uri", requestParam.get("redirect"));
        params.add("code", requestParam.get("code"));

        RestTemplate template = new RestTemplate();

        HttpEntity<Object> requestEntity = new HttpEntity<>(params, headers);

        ResponseEntity<Map> responseEntity
                = template.exchange(requestUri, HttpMethod.POST, requestEntity, Map.class);

        Map<String, Object> responseJSON = (Map<String, Object>)responseEntity.getBody();


        String accessToken = (String) responseJSON.get("access_token");

        return accessToken;
    }


}
