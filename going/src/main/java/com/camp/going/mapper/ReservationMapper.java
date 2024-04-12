package com.camp.going.mapper;

import com.camp.going.entity.Reservation;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

    void reservationSave(Reservation reservation);

}
