package com.camp.going.dto.request;

import lombok.*;

@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode @Builder
public class UserLoginRequestDTO {

    private String email;

    private String password;

    private String phone_number;

    private boolean autoLogin; // 만약에 자동로그인 체크여부 안하면 지우기



}
