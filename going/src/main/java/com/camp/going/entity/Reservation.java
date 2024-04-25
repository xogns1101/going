package com.camp.going.entity;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor @Builder
public class Reservation {

    private int reservationNumber;
    private int campId; // 캠핑장 고유 번호
    private String campName; // 캠핑장 이름
    private String email; // 사용자 이메일 (아이디)
    private LocalDate regDate; // 최초 예약 날짜
    private LocalDate regDates; // 퇴실 예약 날짜
    private int price; // 캠핑장 가격
    private String phoneNumber; //  사용자 전화 번호





}
