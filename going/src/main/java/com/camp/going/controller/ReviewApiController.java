package com.camp.going.controller;

import com.camp.going.common.Page;
import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewPostRequestDTO;
import com.camp.going.dto.response.ReviewListResponseDTO;
import com.camp.going.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewApiController { //

    private final ReviewService reviewService;

    // 리뷰 목록 조회 요청
    @GetMapping("/review")
    public ResponseEntity<?> list(@PathVariable int reviewNo, @PathVariable int pageNo) {
        System.out.println("/review : GET!");
        System.out.println("pageNo = " + pageNo);

        Page page = new Page();
        page.setPageNo(pageNo);
        page.setAmount(9);

        ReviewListResponseDTO reviews = reviewService.getList(reviewNo , page);

        return ResponseEntity.ok().body(reviews);
    }
    
    // 리뷰 등록
    @PostMapping
    @ResponseBody
    public ResponseEntity<?> create(@Validated @RequestBody ReviewPostRequestDTO dto,
                                    BindingResult result,
                                    HttpSession session) {
        
        if (result.hasErrors()) {
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }
        log.info("/review : POST, dto : {}", dto);
        
        reviewService.register(dto, session);
        
        return ResponseEntity.ok().body("success");
        
    }

    // 리뷰 수정
    @PutMapping
    public ResponseEntity<?> update(@Validated @RequestBody ReviewModifyRequestDTO dto,
                                    BindingResult result) {

        if (result.hasErrors()) {
            return ResponseEntity
                    .badRequest()
                    .body(result.toString());
        }

        System.out.println("/review : PUT");
        System.out.println("dto = " + dto);

        reviewService.modify(dto);
        return ResponseEntity.ok().body("modSuccess");
    }

    // 리뷰 삭제
    @DeleteMapping("/{reviewNo}")
    public ResponseEntity<?> remove(@PathVariable Integer reviewNo) {
        if (reviewNo == null) {
            return ResponseEntity
                    .badRequest()
                    .body("리뷰 번호가 전달되지 않음!");
        }

        System.out.println("/review/" + reviewNo + " : DELETE");

        try {
            reviewService.delete(reviewNo);
            return ResponseEntity
                    .ok()
                    .body("delSuccess");
        } catch (Exception e) {
            return ResponseEntity
                    .internalServerError()
                    .body(e.getMessage());
        }
    }



}