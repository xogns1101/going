package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewModifyRequestDTO {

    @NotNull
    private int rno; // 수정할 리뷰 번호

    @NotBlank
    private String content; // 수정할 리뷰 내용

    private String image; // 수정할 이미지
    private int point; // 수정할 별점

    public Review toEntity() {
        return Review.builder()
                .reviewNo(rno)
                .reviewContent(content)
                .reviewImage(image)
                .reviewPoint(point)
                .build();
    }

}