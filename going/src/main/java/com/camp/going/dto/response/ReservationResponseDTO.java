package com.camp.going.dto.response;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@Setter
public class ReservationResponseDTO {

    private int campId;
    private String name;
    private String email;
    private String campName;
    private String regDate; // 입실
    private String regDates; // 퇴실
    private String campAddress;
    private String campHomepage;
    private String campNumber;
    private String phoneNumber;
    private int campPrice;


    public ReservationResponseDTO(Reservation reservation
            , Camping camping , User user) {

        this.campId = reservation.getCampId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.campName = camping.getCampName();
        this.regDate = String.valueOf(reservation.getRegDate());
        this.regDates = String.valueOf(reservation.getRegDates());
        this.campAddress = camping.getCampAddress();
        this.campHomepage = camping.getCampHomepage();
        this.campNumber = camping.getCampNumber();
        this.phoneNumber = user.getPhoneNumber();
        this.campPrice = camping.getCampPrice();
    }
}

