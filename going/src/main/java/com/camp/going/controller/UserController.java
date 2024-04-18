package com.camp.going.controller;

import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.entity.User;
import com.camp.going.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    // 회원가입 처리 서비스
    @GetMapping("/sign-up")
    public void signUp(){

        log.info("/user/sign-up: GET");

    }

    // 아이디 중복체크 비동기 요청 처리
    @GetMapping("/check/{type}/{keyword}")
    @ResponseBody
    public ResponseEntity<?> check(@PathVariable String type,
                                         @PathVariable String keyword){
        log.info("/members/check: async GET");
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

        return "redirect:(jsp 경로)";

    }

    // 로그인 양식 화면 요청 처리
    @GetMapping("/sign-in")
    public void signIn() {
        log.info("/user/sign-in: GET!");
    }

}
