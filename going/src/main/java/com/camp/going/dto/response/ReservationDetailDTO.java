package com.camp.going.dto.response;

import com.camp.going.entity.Reservation;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
public class ReservationDetailDTO {

    private int campId; // 캠핑장 고유 번호
    private String email; // 사용자 이메일 (아이디)
    private LocalDateTime regDate; // 예약 날짜
    private int price; // 캠핑장 가격
    private String phoneNumber; //  사용자 전화 번호

    public ReservationDetailDTO(Reservation reservation) {

        this.campId = reservation.getCampId();
        this.email = reservation.getEmail();
        this.regDate = LocalDateTime.parse(CampingListResponseDTO.makePrettierDateString(reservation.getRegDate()));
        this.price = reservation.getPrice();
        this.phoneNumber = reservation.getPhoneNumber();
    }
}
