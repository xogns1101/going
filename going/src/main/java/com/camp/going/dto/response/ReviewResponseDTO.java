package com.camp.going.dto.response;

import com.camp.going.entity.Review;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
public class ReviewResponseDTO {

    private int reviewNo; // 리뷰 글 번호
    private String reviewContent; // 리뷰 내용
    private String reviewImage; // 리뷰 사진
    private String reviewPoint; // 리뷰 별점
    private String email; // 회원 아이디
    private String campName;
    private int reviewLike; // 리뷰 조회수
    private LocalDateTime reviewDate; // 리뷰 입력 날짜

    public ReviewResponseDTO(Review review) {
        this.reviewNo = review.getReviewNo();
        this.reviewContent = review.getReviewContent();
        this.reviewImage = review.getReviewImage();
        this.reviewPoint = review.getReviewPoint();
//        this.email = makeShortEmail(review.getEmail());
        this.reviewLike = review.getReviewLike();
        this.reviewDate = review.getReviewDate();
        this.campName = review.getCampName();
    }

    private String makeShortEmail(String email) {
        int idx = email.indexOf("@");
        return email.substring(0, idx);
    }


}
