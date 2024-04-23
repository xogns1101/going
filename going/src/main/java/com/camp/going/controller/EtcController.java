package com.camp.going.controller;

import com.camp.going.common.Search;
import com.camp.going.dto.response.CampingListResponseDTO;
import com.camp.going.service.CampingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
@Slf4j
public class EtcController {

    private final CampingService service;

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
