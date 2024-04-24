package com.camp.going.controller;

import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewLikeController {

    private final ReviewService reviewService;

    @PostMapping("/review/{reviewNo}")
    public int updateLike(@RequestBody ReviewModifyRequestDTO dto,
                           @PathVariable int reviewNo) {
        return reviewService.getLike(reviewNo);
    }

}