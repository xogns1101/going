package com.camp.going.controller;

import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewRequestDTO;
import com.camp.going.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/main/reviews")
@RequiredArgsConstructor
@Slf4j
public class ReviewLikeController {

    private final ReviewService reviewService;

    @PutMapping
    public ResponseEntity<?> Like(@RequestBody ReviewRequestDTO dto,
                                  BindingResult result) {

        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body(result.toString());
        }

        System.out.println("/main/reviews : PUT");
        System.out.println("dto : " + dto);

        reviewService.getLike(dto.getReviewNo());

        return ResponseEntity.ok().body("LikeSuccess");
    }

}