package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@Builder
public class ReviewPostRequestDTO {

    @NotBlank
    @Size(min = 1, max = 400)
    private String content; // 리뷰 내용

    @NotBlank
    @Size(min = 1, max = 30)
    private String nickname; // 리뷰 작성자

    private String image;

    @NotNull
    private int point; // 별점

    public Review toEntity() {
        return Review.builder()
                .reviewContent(this.content)
                .email(this.nickname)
                .reviewImage(this.image)
                .reviewPoint(this.point)
                .build();
    }

}
