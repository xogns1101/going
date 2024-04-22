package com.camp.going.service;

import com.camp.going.dto.request.KakaoSignUpRequestDTO;
import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.response.KakaoUserResponseDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.dto.response.NaverUserResponseDTO;
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
public class SnsLoginService {

    private final UserService userService;

    public void kakaoLogin(Map<String, String> params, HttpSession session) {

        String accessToken = getKakaoAccessToken(params);
        session.setAttribute("access_token", accessToken);
        log.info("access_token: {}", accessToken);

        // 전달받은 액세스 토큰을 활용하여 사용자 정보를 가져오기.
        KakaoUserResponseDTO dto = getKakaoUserInfo(accessToken);

        // 카카오에서 받은 회원정보로 우리 사이트 회원가입
        String email = dto.getAccount().getEmail();
        log.info("이메일: {}", email);

        // 회원 중복확인 (이메일)
        if (!userService.checkDuplicateValue("email", email)) {
            // 한번도 카카오 로그인을 한 적이 없다면 회원가입이 들어간다.
            userService.joins(
                    KakaoSignUpRequestDTO.builder()
                            //       .account(String.valueOf(dto.getId()))
                            .account(String.valueOf(dto.getId()))
                            .password("0000")
                            //       .name(dto.getProperties().getNickname())
                            .name(dto.getProperties().getNickname())
                            .email(email)
                            .loginMethod(User.LoginMethod.KAKAO)
                            .build(),
                    dto.getProperties().getProfileImage()
            );
        }

        // 우리 사이트 로그인 처리
        // email
        userService.maintainLoginState(session, String.valueOf(dto.getId()));


    }

    private KakaoUserResponseDTO getKakaoUserInfo(String accessToken) {
        String requestUri = "https://kapi.kakao.com/v2/user/me";

        // 요청 헤더
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // 요청 보내기
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

    private String getKakaoAccessToken(Map<String, String> requestParam) {

        // 요청 URI
        String requestUri = "https://kauth.kakao.com/oauth/token";

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // 요청 바디에 파라미터 세팅
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", requestParam.get("appKey"));
        params.add("redirect_uri", requestParam.get("redirect"));
        params.add("code", requestParam.get("code"));

        // 카카오 인증서버로 POST 요청 날리기
        RestTemplate template = new RestTemplate();

        // 헤더 정보와 파라미터를 하나로 묶기.
        HttpEntity<Object> requestEntity = new HttpEntity<>(params, headers);

        /*
            - RestTemplate객체가 REST API 통신을 위한 API인데 (자바스크립트 fetch역할)
            - 서버에 통신을 보내면서 응답을 받을 수 있는 메서드가 exchange
            param1: 요청 URL
            param2: 요청 방식 (get, post, put, patch, delete...)
            param3: 요청 헤더와 요청 바디 정보 - HttpEntity로 포장해서 줘야 함
            param4: 응답결과(JSON)를 어떤 타입으로 받아낼 것인지 (ex: DTO로 받을건지 Map으로 받을건지)
         */
        ResponseEntity<Map> responseEntity
                = template.exchange(requestUri, HttpMethod.POST, requestEntity, Map.class);

        // 응답 데이터에서 JSON 추출
        Map<String, Object> responseJSON = (Map<String, Object>) responseEntity.getBody();
        log.info("응답 JSON 데이터: {}", responseJSON);

        // access token 추출 (카카오 로그인 중인 사용자의 정보를 요청할 때 필요한 토큰)
        String accessToken = (String) responseJSON.get("access_token");

        log.info("토큰 번호 : {}", accessToken);

        return accessToken;
    }


    public void naverLogin(Map<String, String> params, HttpSession session) {

        String accessToken = getNaverAccessToken(params);
        session.setAttribute("access_token", accessToken);
        log.info("access_token: {}", accessToken);

        NaverUserResponseDTO dto = getNaverInfo(accessToken);

        // 네이버에서 받은 회원정보로 우리 사이트 회원가입
        String email = dto.getResponseData().getEmail();
        log.info("이메일: {}", email);

        // 회원 중복확인 (이메일)
        if (!userService.checkDuplicateValue("email", email)) {
            // 한번도 카카오 로그인을 한 적이 없다면 회원가입이 들어간다.
            userService.join(
                    SignUpRequestDTO.builder()
                            .email(email)
                            .password("0000")
                            .name(dto.getResponseData().getName())
                            .phoneNumber(dto.getResponseData().getMobile())
                            .loginMethod(User.LoginMethod.NAVER)
                            .build()

            );
        }

        // 우리 사이트 로그인 처리
        userService.maintainLoginState(session, email);


    }

    public NaverUserResponseDTO getNaverInfo(String accessToken) {

        String requestUri = "https://openapi.naver.com/v1/nid/me";

        // 요청 헤더
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        //  요청 보내기
        RestTemplate template = new RestTemplate();
        ResponseEntity<NaverUserResponseDTO> responseEntity = template.exchange(
                requestUri,
                HttpMethod.POST,
                new HttpEntity<>(headers),
                NaverUserResponseDTO.class
        );

        NaverUserResponseDTO responseJSON = (NaverUserResponseDTO) responseEntity.getBody();
        log.info("응답 데이터 결과: {}", responseJSON);

        return responseJSON;
    }

    public String getNaverAccessToken(Map<String, String> requestParam) {

        // 요청 URI
        String requestUri = "https://nid.naver.com/oauth2.0/token";

        // 요청 바디에 파라미터 세팅
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", requestParam.get("clientId"));
        params.add("client_secret", requestParam.get("clientSecret"));
        params.add("code", requestParam.get("code"));
        params.add("state", requestParam.get("state"));

        log.info("params: {}", params);

        // 카카오 인증서버로 POST 요청 날리기
        RestTemplate template = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();

        // 헤더 정보와 파라미터를 하나로 묶기.
        HttpEntity<Object> requestEntity = new HttpEntity<>(params, headers);

        ResponseEntity<Map> responseEntity
                = template.exchange(requestUri, HttpMethod.POST, requestEntity, Map.class);

        // 응답 데이터에서 JSON 추출
        Map<String, Object> responseJSON = (Map<String, Object>) responseEntity.getBody();
        log.info("응답 JSON 데이터: {}", responseJSON);

        // access token 추출 (카카오 로그인 중인 사용자의 정보를 요청할 때 필요한 토큰)
        String accessToken = (String) responseJSON.get("access_token");

        return accessToken;


    }




}
