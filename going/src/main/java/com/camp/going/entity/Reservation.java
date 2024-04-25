package com.camp.going.entity;

import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor @Builder
public class Reservation {

    private int reservationNumber;
    private int userId;
    private int campId; // 캠핑장 고유 번호
    private LocalDate regDate; // 최초 예약 날짜
    private LocalDate regDates; // 퇴실 예약 날짜






}
