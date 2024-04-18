package com.camp.going.entity;

import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor @AllArgsConstructor
@Builder
public class User {

    private String email;
    private String password;
    private String phoneNumber;
    private String auth;
    private LoginMethod loginMethod;

    private LocalDateTime limitTime;

    private enum LoginMethod {
        COMMON, KAKAO, NAVER
    }
}
