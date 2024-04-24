package com.camp.going.controller;

import com.camp.going.dto.request.LoginRequestDTO;
import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.entity.User;
import com.camp.going.service.LoginResult;
import com.camp.going.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static com.camp.going.util.LoginUtils.LOGIN_KEY;
import static com.camp.going.util.LoginUtils.isAutoLogin;


@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    // 회원가입 처리 서비스
    @GetMapping("/sign-up")
    public String signUp(){

        log.info("/user/sign-up: GET");

        return "sign-up";

    }

    // 아이디 중복체크 비동기 요청 처리
    @GetMapping("/check/{type}/{keyword}")
    @ResponseBody
    public ResponseEntity<?> check(@PathVariable String type,
                                         @PathVariable String keyword){
        log.info("/user/check: async GET");
        log.debug("type: {}, keyword: {}", type, keyword);

        boolean flag = userService.checkDuplicateValue(type, keyword);

        return ResponseEntity.ok().body(flag);

    }

    // 회원 가입 로직
    @PostMapping("/sign-up")
    public String signUp(SignUpRequestDTO dto){
        log.info("/user/sign-up: POST, dto: {}", dto);

        // 일반 방식(우리사이트를 통해)으로 회원가입
        dto.setLoginMethod(User.LoginMethod.COMMON);

        userService.join(dto);

        return "redirect:/main";

    }

    // 로그인 양식 화면 요청 처리
    @GetMapping("/sign-in")
    public String signIn() {
        log.info("/user/sign-in: GET!");

        return "sign-in";

    }


    // 로그인 검증 요청
    @PostMapping("/sign-in")
    public String signIn(LoginRequestDTO dto,
                         RedirectAttributes ra,
                         HttpServletResponse response,
                         HttpServletRequest request){

        log.info("/user/sign-in: POST!, dto: {}", dto);

        LoginResult result = userService.authenticate(dto, request.getSession(), response);
        log.info("result: {}", result);

        ra.addFlashAttribute("result", result);

        if (result == LoginResult.SUCCESS) { // 로그인 성공 시

            // 로그인을 했다는 정보를 계속 유지하기 위한 수단으로 쿠키를 사용하자.
            // makeLoginCookie(dto, response);

            // 세션으로 로그인 유지
            userService.maintainLoginState(request.getSession(), dto.getEmail());

            return "redirect:/main";
        }

        return "redirect:/user/sign-in"; // 로그인 실패 시

    }

    public void makeLoginCookie(LoginRequestDTO dto, HttpServletResponse response) {
        // 쿠키에 로그인 기록을 저장
        // 쿠키 객체를 생성 -> 생성자의 매개값으로 쿠키의 이름과 저장할 값을 전달. (문자열만 저장됨. 용량의 한계도 있음)
        Cookie cookie = new Cookie("login", dto.getEmail());

        // 쿠키 세부 설정
        cookie.setMaxAge(60); // 쿠키 수명 설정(초)
        cookie.setPath("/"); // 이 쿠키는 모든 경로에서 유효하다.

        // 쿠키가 완성됐다면 응답 객체에 쿠키를 태워서 클라이언트로 전송
        response.addCookie(cookie);
    }

    // 카카오 로그아웃 요청 처리
    @GetMapping("/sign-out")
    public String signOut(HttpSession session,
                          HttpServletRequest request,
                          HttpServletResponse response) {
        log.info("/kakao/sign-out: GET!");

        // 자동 로그인 중인지 확인
        if (isAutoLogin(request)) {
            // 쿠키를 삭제해주고 DB 데이터도 원래대로 돌려놓아야 한다.
            userService.autoLoginClear(request, response);
        }

        // sns 로그인 상태인지를 확인
        LoginUserResponseDTO dto = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        if (dto.getLoginMethod().equals("KAKAO")) {
            userService.kakaoLogout(dto, session);
        }

        // 세션에서 로그인 정보 기록 삭제
        session.removeAttribute("login");

        // 세션 전체 무효화 (초기화)
        session.invalidate();

        return "redirect:/";

    }



}
