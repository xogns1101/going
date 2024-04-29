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


    private int reservationNumber;
    private String campName;
    private String email;
    private String regDate; // 입실
    private String regDates; // 퇴실
    private int campPrice;
    private String phoneNumber;


    public ReservationResponseDTO(Reservation reservation){

        this.reservationNumber = reservation.getReservationNumber();
        this.campName = reservation.getCampName();
        this.email = reservation.getEmail();
        this.regDate = String.valueOf(reservation.getRegDate());
        this.regDates = String.valueOf(reservation.getRegDates());
        this.campPrice = reservation.getCampPrice();
        this.phoneNumber = reservation.getPhoneNumber();


    }




}

