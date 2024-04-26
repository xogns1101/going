package com.camp.going.service;

import com.camp.going.dto.request.ReservationRequestDTO;
import com.camp.going.dto.response.ReservationResponseDTO;
import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.mapper.ReservationMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationMapper reservationMapper;

    private final UserService userService;

    private final CampingService campingService;


//    public List<ReservationResponseDTO> getReservationList(int userId) {
//
//        Reservation reservation = reservationMapper.selectReservation(userId);
//
//        List<ReservationResponseDTO> reservationResponseDTOList = new ArrayList<>();
//
//
//
//        return null;
//
//
//
//
//
//    }


    public void getReservation(ReservationRequestDTO dto) {

        reservationMapper.reservationSave(dto.toEntity());


    }
}
