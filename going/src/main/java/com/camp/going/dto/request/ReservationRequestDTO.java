package com.camp.going.dto.request;


import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor @AllArgsConstructor
@Builder
public class ReservationRequestDTO {

    private int campId;
    private String email;
    private String campName;
    private LocalDate regDate;
    private LocalDate regDates;
    private int campPirce;
    private String phoneNumber;


    public Reservation toEntity(){
       return  Reservation.builder()
                .campId(campId)
                .email(email)
                .campName(campName)
                .regDate(regDate)
                .regDates(regDates)
                .price(campPirce)
                .phoneNumber(phoneNumber)
                .build();
    }


















}
