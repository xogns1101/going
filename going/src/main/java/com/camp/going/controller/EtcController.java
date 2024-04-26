package com.camp.going.controller;

import com.camp.going.dto.request.ReviewRequestDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Review;
import com.camp.going.service.CampingService;
import com.camp.going.service.ReviewService;
import com.camp.going.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
@Slf4j
public class EtcController {

    private final ReviewService reviewService;

    @Value("${file.upload.root-path}")
    private String rootPath;

    // 메인화면 이동하기
    @GetMapping("")
    public String main(Model model) {
        log.info("/main: GET");

        Review review = reviewService.bestReview();

        model.addAttribute("r", review);

        return "index";
    }

    // 소개화면 이동하기
    @GetMapping("/introduce")
    public String introduce(Model model) {
        log.info("/main/introduce: GET");
        return "introduce";
    }

}
