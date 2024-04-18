package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewRequestDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Review;
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
    public String reviewList(Model model, @ModelAttribute("s") Search page) {
        System.out.println("search = " + page);
        List<ReviewResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("rList", dtoList);
        model.addAttribute("marker", pageMaker);

        return "review";
    }

    // 리뷰 쓰기 화면 요청 (/review/write : GET)
    @GetMapping("/review-write")
    public String reviewWrite() {
        System.out.println("/review/write : GET!");
        return "review-write";
    }

    // 리뷰 등록 요청 (/review/write : POST)
    @PostMapping("/review-write")
    public String reviewWrite(ReviewRequestDTO dto, HttpSession session) {
        log.info("/review/write : POST, dto : {}", dto);

        service.register(dto, session);
        return "redirect:/review/list";
    }

    // 리뷰 수정 요청
    @GetMapping("/modify")
    public String modify(ReviewModifyRequestDTO dto) {
        service.modify(dto);

        return "redirect:/review-write";
    }

    // 리뷰 삭제 요청 (/review/delete : GET)
    @GetMapping("/review-delete")
    public String deleteReview(int rno) {
        System.out.println("/review/delete : GET! " + rno);
        service.delete(rno);

        return "redirect:/review";
    }

}
