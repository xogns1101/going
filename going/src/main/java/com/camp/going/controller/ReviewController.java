package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.ReviewPostRequestDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

    private final ReviewService service;

    // 리뷰 목록
    @GetMapping("/review")
    public String reviewList(Model model, @ModelAttribute("s") Search page ) {
        System.out.println("search = " + page);
        List<ReviewResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("review", dtoList);
        model.addAttribute("marker", pageMaker);

        return "";
    }

    // 리뷰 쓰기 화면 요청 (/review/write : GET)
    @GetMapping("/write")
    public String reviewWrite() {
        System.out.println("/review/write : GET!");
        return "/write";
    }

    // 리뷰 등록 요청 (/review/write : POST)
    @PostMapping("/write")
    public String reviewWrite(ReviewPostRequestDTO dto, HttpSession session) {
        log.info("/review/write : POST, dto : {}", dto);

        return "redirect:/review/list";
    }

    // 리뷰 수정 요청

    // 리뷰 삭제 요청 (/review/delete : GET)
    @GetMapping("/delete")
    public String deleteReview(int rno) {
        System.out.println("/review/delete : GET! " + rno);

        return "redirect:/review/list";
    }

}
