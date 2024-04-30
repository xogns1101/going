package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReservationMapperTest {

    @Autowired
    ReservationMapper reservationMapper;



//    @Test
//    @DisplayName("예약이 잘 되는지 확인")
//    void reservationInsert() {
//        // given
//        String regDate = "2024-04-25";
//        String regDates = "2024-04-26";
//
//        Reservation reservation = Reservation.builder()
//                .reservationNumber(1)
//                .email("aaa2222@naver.com")
//                .campId(1)
//                .regDate(LocalDate.parse(regDate))
//                .regDates(LocalDate.parse(regDates))
//                .build();
//        // when
//        reservationMapper.reservationSave(reservation);
//        // then
//    }

    @Test
    @DisplayName("예약이 잘 되는지 확인")
    void reservationInsert() {
        // given
        String regDate = "2024-04-25";
        String regDates = "2024-04-26";

        Reservation reservation = Reservation.builder()
                .reservationNumber(13)
//                .email("aaa2222@naver.com")
                .campId(1)
                .regDate(LocalDate.parse(regDate))
                .regDates(LocalDate.parse(regDates))
                .build();
        // when

        reservationMapper.reservationSave(reservation);
        // then
    }

    
//    @Test
//    @DisplayName("상세 회면이 잘보이는지")
//    void findCampTest() {
//        // given
//        int campId= 3;
//        // when
//        Reservation one = reservationMapper.findOne(campId);
//        // then
//        assertEquals(one.getCampName(), "홀리데이캠핑장");
//    }


    @Test
    @DisplayName("예약 확인 내역 보기")
    void reservationCampingList() {
        // given

        // when
        List<Reservation> reservations = reservationMapper.reservationCamping();

        // then
        assertEquals(1, reservations.size());
    }



}