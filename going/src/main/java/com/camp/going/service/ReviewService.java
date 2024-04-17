package com.camp.going.service;

import com.camp.going.common.Page;
import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewPostRequestDTO;
import com.camp.going.dto.response.ReviewListResponseDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Review;
import com.camp.going.mapper.ReviewMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewMapper reviewMapper;

    public void register(ReviewPostRequestDTO dto, HttpSession session) {
        Review review = dto.toEntity();

//        review.setEmail(getCurrentLoginMemberAccount(session));

        reviewMapper.saveReview(review);
    }

    public ReviewListResponseDTO getList(int reviewNo, Page page) {
        List<ReviewResponseDTO> dtoList = new ArrayList<>();

        // 리뷰 정보 조회
        List<Review> reviewList = reviewMapper.findAllReview(reviewNo, page);
        for (Review review : reviewList) {
            dtoList.add(new ReviewResponseDTO(review));
        }

        // 총 리뷰 개수 조회
        int count = reviewMapper.getCount(reviewNo);

        return ReviewListResponseDTO.builder()
                .reviews(dtoList)
                .count(count)
                .pageInfo(new PageMaker(page, count))
                .build();
    }

    public void modify(ReviewModifyRequestDTO dto) {
        Review review = dto.toEntity();
        reviewMapper.modifyReview(review);
    }

    public void delete(Integer rno) {
        reviewMapper.deleteReview(rno);
    }

    public int getLike(int rno) {
        return reviewMapper.updateLikeCount(rno);
    }

    public int dellike(int rno) {
        return reviewMapper.cancelLikeReview(rno);
    }

}
