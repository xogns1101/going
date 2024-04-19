package com.camp.going.dto.response;

import com.camp.going.entity.MyPage;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
public class MyPageResponseDTO {

    private String name;
    private String phoneNumber;
    private String password;

    private String campName;
    private LocalDateTime regDate; // 입실
    private LocalDateTime regDates; // 퇴실
    private String campHomepage;
    private String campNumber;
    private String campImage;

    public MyPageResponseDTO(MyPage myPage) {
        this.name = myPage.getName();
        this.phoneNumber = myPage.getPhoneNumber();
        this.password = myPage.getPassword();
    }

}