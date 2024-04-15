package com.camp.going.mapper;

import com.camp.going.entity.Review;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReviewMapperTest {

    @Autowired
    ReviewMapper reviewMapper;

    @Test
    @DisplayName("리뷰 작성에 성공하기")
    void saveReviewTest() {
        // given

        // when
        Review review = Review.builder()
                .reviewTitle("리뷰 테스트2222")
                .reviewContent("리뷰 테스트 중입니다. 잘 들어가고 있나요?")
                .email("aaaa@naver.com")
                .campId(4)
                .reviewPoint(4)
                .reviewCount(0)
                .build();

        reviewMapper.saveReview(review);
        // then
    }

    @Test
    @DisplayName("리뷰 글 번호 1번인 글 지우기")
    void deleteReviewTest() {
        // given
        int reviewNo = 3;
        // when
        reviewMapper.deleteReview(reviewNo);
        reviewMapper.findAllReview();
        // then
    }

    @Test
    @DisplayName("리뷰 전체 나오기")
    void findAllReviewTest() {
        // given

        // when
        List<Review> allReview = reviewMapper.findAllReview();

        // then
        assertEquals(2, allReview.size());
    }

}