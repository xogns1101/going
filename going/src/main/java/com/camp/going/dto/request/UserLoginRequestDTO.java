package com.camp.going.dto.request;

import lombok.*;

@Setter @Getter @ToString
@AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode @Builder
public class UserLoginRequestDTO {

    private String email;

    private String password;




}
