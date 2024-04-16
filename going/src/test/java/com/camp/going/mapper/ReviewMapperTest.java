package com.camp.going.mapper;

import com.camp.going.entity.Review;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
                .reviewTitle("날짜와 시간 확인")
                .reviewContent("리뷰 작성 날짜랑 시간 잘 입력되나 확인확인")
                .email("addf@naver.com")
                .campId(51)
                .reviewPoint(5)
                .reviewDate(LocalDateTime.now())
                .build();

        reviewMapper.saveReview(review);
        // then
    }

    @Test
    @DisplayName("리뷰 글 번호 1번인 글 지우기")
    void deleteReviewTest() {
        // given
        int reviewNo = 8;
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
        assertEquals(8, allReview.size());
    }
    
    @Test
    @DisplayName("리뷰 글 번호 2번인 리뷰글 수정하기")
    void modifyReviewTest() {
        // given
        int reviewNo = 8;
        Review modReview = Review.builder()
                .reviewNo(reviewNo)
                .reviewTitle("sql 확인")
                .reviewContent("대체 뭐가 잘못됐냐고")
                .reviewPoint(3)
                .reviewImage("")
                .build();

        // when
        reviewMapper.modifyReview(modReview);
        // then
    }

    @Test
    @DisplayName("리뷰 글 번호 6번인 리뷰 조회수 올리기")
    void countReviewTest() {
        // given
        int reviewNo = 10;
        // when
        reviewMapper.countReview(reviewNo);

        // then
    }

    @Test
    @DisplayName("조회수가 가장 높은 게시글이 1개만 보인다.")
    void bestReviewTest() {
        // given

        // when
        Review bestReview = reviewMapper.bestReview();
        // then
        assertEquals(21, bestReview.getReviewCount());

    }

}