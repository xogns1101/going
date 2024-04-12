package com.camp.going.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor @Builder
public class Reservation {

    private int campId;
    private String email;
    private LocalDateTime regDate;
    private int price;
    private String phoneNumber;









}
