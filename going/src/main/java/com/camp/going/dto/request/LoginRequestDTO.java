package com.camp.going.dto.request;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginRequestDTO {

    private String account;
    private String password;
    private boolean autoLogin; // 자동로그인 체크 여부

}
