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
    private int campId;
    private String phoneNumber;
    private String loginMethod;
    private String campName;
    private String regDate; // 입실
    private String regDates; // 퇴실
    private String campAddress;
    private String campHomepage;
    private String campNumber;





}
