package com.camp.going.mapper;

import com.camp.going.entity.Reservation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReservationMapper {

    //
    void reservationSave(Reservation reservation);

    List<Reservation> reservationCamping();



    void delete(int campId);




}
