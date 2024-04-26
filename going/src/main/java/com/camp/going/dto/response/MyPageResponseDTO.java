package com.camp.going.dto.response;

import com.camp.going.entity.MyPage;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
public class MyPageResponseDTO {

    private int userId;
    private String name;
    private String phoneNumber;
    private int camId;
    private String email;
    private String campName;
    private String campAddress;
    private String campHomepage;
    private LocalDateTime regDate; // 입실
    private LocalDateTime regDates; // 퇴실
    private String campNumber;
    private String campImage;

    public MyPageResponseDTO(MyPage myPage) {
        this.userId = myPage.getUserId();
        this.name = myPage.getName();
        this.phoneNumber = myPage.getPhoneNumber();
        this.email = myPage.getEmail();
        this.campName = myPage.getCampName();
        this.regDate = myPage.getRegDate();
        this.regDates = myPage.getRegDates();
        this.campNumber = myPage.getCampNumber();
        this.campImage = myPage.getCampImage();
        this.campAddress = myPage.getCampAddress();
        this.campHomepage = myPage.getCampHomepage();
        this.camId = myPage.getCampId();


    }

}