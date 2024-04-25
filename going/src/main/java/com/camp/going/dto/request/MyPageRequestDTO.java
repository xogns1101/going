package com.camp.going.dto.request;

import com.camp.going.entity.MyPage;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyPageRequestDTO {

    @NotNull
    private String name;

    @NotNull
    private String email;

    @NotNull
    private String phoneNumber;


    private String campName;
    private LocalDateTime regDate;
    private LocalDateTime regDates;
    private String campImage;

    public MyPage toEntity() {
        return MyPage.builder()
                .name(name)
                .phoneNumber(phoneNumber)
                .build();
    }

}