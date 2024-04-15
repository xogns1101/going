package com.camp.going.entity;

import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor @AllArgsConstructor
@Builder
public class User {

    private String email;
    private String password;
    private String phoneNumber;
    private String auth;
    private LoginMethod loginMethod;
    private String profileImage;

    public enum LoginMethod {
        COMMON, KAKAO, NAVER
    }
}
