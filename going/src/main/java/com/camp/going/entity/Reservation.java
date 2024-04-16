package com.camp.going.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor @Builder
public class Reservation {

    private int campId; // 캠핑장 고유 번호
    private String email; // 사용자 이메일 (아이디)
    private LocalDateTime regDate; // 예약 날짜
    private int price; // 캠핑장 가격 
    private String phoneNumber; //  사용자 전화 번호




}
