package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReservationMapperTest {

    @Autowired
    ReservationMapper reservationMapper;


    @Test
    @DisplayName("예약이 잘 되는지 확인")
    void reservationInsert() {
        // given
        Reservation reservation = Reservation.builder()
                .campId(1)
                .email("aaa1111@naver.com")
                .price(70000)
                .phoneNumber("010-1454-5378")
                .build();
        // when
        reservationMapper.reservationInsert(reservation);
        // then
    }
    
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