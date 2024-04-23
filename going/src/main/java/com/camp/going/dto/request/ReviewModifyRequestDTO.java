package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewModifyRequestDTO {

    @NotNull
    private int rno; // 수정할 리뷰 번호

    @NotBlank
    private String reviewContent; // 수정할 리뷰 내용

    private MultipartFile reviewImage; // 수정할 이미지
    private String starPoint; // 수정할 별점
    // 10 (인풋값) / 10 (고정값)
    public Review toEntity(String savePath) {
        return Review.builder()
                .reviewNo(rno)
                .reviewContent(reviewContent)
                .reviewImage(savePath)
                .reviewPoint(starPoint)
                .build();
    }

}