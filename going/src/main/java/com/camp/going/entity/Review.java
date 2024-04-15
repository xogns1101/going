package com.camp.going.entity;

import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    private int reviewNo; // 리뷰 글 번호
    private String reviewTitle; // 리뷰 제목
    private String reviewContent; // 리뷰 내용
    private String email; // 회원 아이디
    private int campId; // 캠핑장 아이디
    private String reviewImage; // 리뷰 사진
    private int reviewPoint; // 별점
    private int reviewCount; // 리뷰 조회수


}