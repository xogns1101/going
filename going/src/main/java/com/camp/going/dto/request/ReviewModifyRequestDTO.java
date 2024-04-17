package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewModifyRequestDTO {

    @NotNull
    private int rno; // 수정할 리뷰 글 번호

    @NotNull
    private String text; // 수정할 리뷰 내용

    @NotNull
    private int point; // 수정할 별점

    private String image; // 수정할 리뷰 사진

    public Review toEntity() {
        return Review.builder()
                .reviewNo(rno)
                .reviewContent(text)
                .reviewPoint(point)
                .reviewImage(image)
                .build();
    }

}
