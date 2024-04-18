package com.camp.going.controller;

import com.camp.going.dto.request.SignUpRequestDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {

    // 회원가입 처리 서비스
    @GetMapping("/test")
    public String signUp(SignUpRequestDTO dto){

        return "";
    }


}
