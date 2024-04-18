package com.camp.going.mapper;

import com.camp.going.common.Search;
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
                .reviewContent("OO 캠핑장은 어쩌구 저쩌구")
                .email("CCCC@naver.com")
                .campId(99)
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
        int reviewNo = 10;
        // when
        reviewMapper.deleteReview(reviewNo);
        //reviewMapper.findAllReview(page);
        // then
    }

    @Test
    @DisplayName("리뷰 전체 나오기")
    void findAllReviewTest() {
        // given

        // when
        //List<Review> allReview = reviewMapper.findAllReview(page);

        // then
        //assertEquals(11, allReview.size());
    }

    @Test
    @DisplayName("리뷰 글 번호 2번인 리뷰글 수정하기")
    void modifyReviewTest() {
        // given
        int reviewNo = 12;
        Review modReview = Review.builder()
                .reviewNo(reviewNo)
                .reviewContent("수정 날짜 확인해보기")
                .reviewPoint(3)
                .build();

        // when
        reviewMapper.modifyReview(modReview);

        // then
    }

    @Test
    @DisplayName("리뷰 글 번호 6번인 리뷰 좋아요 수 올리기")
    void likeReviewTest() {
        // given
        int reviewNo = 14;
        // when
        reviewMapper.likeReview(reviewNo);

        // then
    }

    @Test
    @DisplayName("조회수가 가장 높은 게시글이 1개만 보인다.")
    void bestReviewTest() {
        // given

        // when
        Review bestReview = reviewMapper.bestReview();
        // then
        assertEquals(15, bestReview.getReviewLike());
    }

}
