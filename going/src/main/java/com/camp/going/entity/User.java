package com.camp.going.entity;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor @AllArgsConstructor
@Builder
public class User {

//    private long id;

    private String email;
    private String password;
    private String phoneNumber;
    private String name;
    private String auth;
    private LoginMethod loginMethod;

    private LocalDateTime userDate;

    // 기존 테이블에서 컬럼을 추가했기 때문에
    // DB 테이블과 1:1로 매칭되는 Entity도 필드가 증가해야 한다.
    private String sessionId;
    private LocalDateTime limitTime;
    private String profileImage;

    public enum LoginMethod {
        COMMON, KAKAO, NAVER
    }
}
