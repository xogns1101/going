package com.camp.going.dto.response;

import com.camp.going.entity.Reservation;
import com.camp.going.entity.Review;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewResponseDTO {

    private int reviewNo; // 리뷰 글 번호
    private String reviewContent; // 리뷰 내용
    private String reviewImage; // 리뷰 사진
    private String reviewPoint; // 리뷰 별점
//    private long userId; // 회원 아이디
    private String email;
//    private int campId;
    private String campName;
    private LocalDateTime reviewDate; // 리뷰 입력 날짜

    public ReviewResponseDTO(Review review) {
        this.reviewNo = review.getReviewNo();
        this.reviewContent = review.getReviewContent();
        this.reviewImage = review.getReviewImage();
        this.reviewPoint = review.getReviewPoint();
//        this.userId = review.getUserId();
        this.email = review.getEmail();
//        this.campId = review.getCampId();
        this.campName = review.getCampName();
        this.reviewDate = review.getReviewDate();
    }

}