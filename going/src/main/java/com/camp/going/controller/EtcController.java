package com.camp.going.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
@Slf4j
public class EtcController {


    // 메인화면 이동하기
    @GetMapping("")
    public String main(Model model) {
        log.info("/main: GET");
        return "index";
    }

    // 소개화면 이동하기
    @GetMapping("/introduce")
    public String introduce(Model model) {
        log.info("/main/introduce: GET");
        return "introduce";
    }

}
