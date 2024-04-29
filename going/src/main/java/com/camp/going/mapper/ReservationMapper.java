package com.camp.going.mapper;

import com.camp.going.common.Search;
import com.camp.going.entity.Reservation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReservationMapper {

    //
    void reservationSave(Reservation reservation);

    List<Reservation> findAllReservation(Search page);

    List<Reservation> reservationCamping();

    void delete(int campId);

    Reservation findReservation(int reservationNumber);

    int count(int userId);

}
