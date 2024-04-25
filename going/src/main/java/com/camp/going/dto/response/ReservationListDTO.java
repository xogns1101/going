package com.camp.going.dto.response;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;

@Getter
@ToString
@EqualsAndHashCode
@Setter
public class ReservationListDTO {


    private int campId;
    private String email;
    private String campName;
    private String regDate; // 입실
    private String regDates; // 퇴실
    private int campPrice;
    private String phoneNumber;


    public ReservationListDTO(Reservation reservation
            , Camping camping , User user) {

        this.campId = camping.getCampId();
        this.email = user.getEmail();
        this.campName = camping.getCampName();
        this.regDate = String.valueOf(reservation.getRegDate());
        this.regDates = String.valueOf(reservation.getRegDates());
        this.campPrice = camping.getCampPrice();
        this.phoneNumber = user.getPhoneNumber();

    }
}

