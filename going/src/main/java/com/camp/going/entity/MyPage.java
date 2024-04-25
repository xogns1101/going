package com.camp.going.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyPage {

    // 회원 정보
    private String name;
    private String phoneNumber;
    private String email;

    // 예약 정보
    private String campName;
    private LocalDateTime regDate; // 입실
    private LocalDateTime regDates; // 퇴실
    private String campNumber;
    private String campImage;


}