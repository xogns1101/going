package com.camp.going.entity;

import com.camp.going.dto.request.ReviewRequestDTO;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    private int reviewNo; // 리뷰 글 번호
    private String reviewContent; // 리뷰 내용
    private String email; // 회원 아이디
    private int campId; // 캠핑장 아이디
    private String campName; // 캠핑장 이름
    private String reviewImage; // 리뷰 사진 경로
    private String reviewPoint; // 별점
    private LocalDateTime reviewDate; // 리뷰 작성 날짜

}