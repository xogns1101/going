package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewRequestDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.dto.response.ReservationResponseDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Review;
import com.camp.going.entity.User;
import com.camp.going.mapper.ReviewMapper;
import com.camp.going.service.ReservationService;
import com.camp.going.service.ReviewService;
import com.camp.going.service.UserService;
import com.camp.going.util.FileUtils;
import com.camp.going.util.LoginUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

    @Value("${file.upload.root-path}")
    private String rootPath;

    private final ReviewService service;

    private final HttpSession session;

    private final ReviewMapper reviewMapper;

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

    // 리뷰 쓰기 화면 요청 (/review-write : GET)
    @GetMapping("/review-write")
    public String reviewWrite() {
        System.out.println("/review-write : GET!");
        return "review-write";
    }

    // 리뷰 등록 요청 (/review-write : POST)
    @PostMapping("/review-write")
    public String reviewWrite(ReviewRequestDTO dto, HttpSession session) {
        log.info("/review-write : POST, dto : {}", dto);
//        log.info("날짜시간 : {}", dto.getReviewDate());
        log.info("file Name : {}", dto.getReviewImage().getOriginalFilename());

        String savePath = FileUtils.uploadFile(dto.getReviewImage(), rootPath);
        log.info("save-path : {}", savePath);

        service.register(dto, savePath, session);

        return "redirect:/main/review";

    }

    // 리뷰 수정 요청
    @GetMapping("/review-modify")
    public String modify(int rno, Model model) {
        ReviewResponseDTO dto = service.getDetail(rno);
        model.addAttribute("r", dto);

        return "review-modify";
    }

    @PostMapping("/review-modify")
    public String modify(ReviewModifyRequestDTO dto) {
        log.info("/main/review-modify : POST, dto : {}", dto);
        String savePath = FileUtils.uploadFile(dto.getReviewImage(), rootPath);
        log.info("rootPath : {}", rootPath);

        service.modify(dto, savePath);

        return "redirect:/main/review";
    }

    // 리뷰 삭제 요청 (/review/delete : GET)
    @GetMapping("/review-delete")
    public String deleteReview(int rno, HttpSession session) {
        System.out.println("/review/delete : GET! " + rno);

        service.delete(rno);

        return "redirect:/main/review";
    }

}
