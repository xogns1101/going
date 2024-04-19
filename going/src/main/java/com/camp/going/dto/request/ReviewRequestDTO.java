package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
public class ReviewRequestDTO {

    private String reviewContent; // 리뷰 내용
//    private String email; // 리뷰 작성자
    private String reviewImage;
    private int reviewPoint;

}