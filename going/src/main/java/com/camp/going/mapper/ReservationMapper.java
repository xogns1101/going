package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Mapper
public interface ReservationMapper {


    void reservationInsert(Reservation reservation);

    List<Reservation> reservationCamping();


}
