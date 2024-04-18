package com.camp.going.dto.response;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@Setter
public class ReservationDetailResponseDTO {


    private int campId; // 캠핑장 고유 번호
    private String campName; // 캠핑장 이름
    private String campAddress; // 캠핑장 주소
    private String campNumber; // 캠핑장 전화 번호
    private String campHomepage; // 캠핑장 홈페이지
    private String campHotWater; // 캠핑장 온수 유무
    private String campWifi; // 캠핑장 와이파이 유무
    private String campFirewood; // 캠핑장 장작 유무
    private String campMart; // 캠핑장 마트 유무
    private String campBed; // 캠핑장 침대 유무
    private String campIceBox; // 캠핑장 냉장고 유무
    private String regDate; // 최초 캠핑장 예약 날짜
    private String regDates; // 퇴실 캠핑장 예약 날짜



    public ReservationDetailResponseDTO(Reservation reservation
            , Camping camping) {

        this.campId = camping.getCampId();
        this.campName = camping.getCampName();
        this.campAddress = camping.getCampAddress();
        this.campNumber = camping.getCampNumber();
        this.campHomepage = camping.getCampHomepage();
        this.campHotWater = camping.getCampHotWater();
        this.campWifi = camping.getCampWifi();
        this.campFirewood = camping.getCampFirewood();
        this.campMart = camping.getCampMart();
        this.campBed = camping.getCampBed();
        this.campIceBox = camping.getCampIceBox();
        this.regDate = CampingListResponseDTO.makePrettierDateString(reservation.getRegDate());
        this.regDates = CampingListResponseDTO.makePrettierDateString(reservation.getRegDates());

    }
}