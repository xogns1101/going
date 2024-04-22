package com.camp.going.dto.response;


import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginUserResponseDTO {

    private long id;
    private String email;
    private String auth;
    private String name;
    private String phoneNumber;
    private String loginMethod;





}
