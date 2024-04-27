package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewRequestDTO {

    private int reviewNo;
    private String reviewContent; // 리뷰 내용
//    private long userId; // 리뷰 작성자
    private String email;
    private MultipartFile reviewImage;
    private String starPoint;
    private LocalDateTime reviewDate;

    public Review toEntity(String savePath) {
        return Review.builder()
                .reviewContent(reviewContent)
                .email(email)
//                .userId(userId)
                .reviewImage(savePath)
                .reviewPoint(starPoint)
                .reviewDate(reviewDate)
                .build();
    }

}