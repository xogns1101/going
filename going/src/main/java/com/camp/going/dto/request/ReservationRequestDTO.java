package com.camp.going.dto.request;


import com.camp.going.entity.Reservation;
import lombok.*;

import java.time.LocalDate;

@Getter @Setter @ToString
@EqualsAndHashCode @NoArgsConstructor @AllArgsConstructor
@Builder
public class ReservationRequestDTO {



    private int campId;
    private String campNumber;
    private LocalDate regDate;
    private LocalDate regDates;


    public Reservation toEntity(){
       return  Reservation.builder()
                .campId(campId)
                .regDate(regDate)
                .regDates(regDates)
                .build();
    }


















}
