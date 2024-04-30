package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.request.ReservationRequestDTO;
import com.camp.going.dto.response.ReservationResponseDTO;
import com.camp.going.entity.Reservation;
import com.camp.going.mapper.ReservationMapper;
import com.camp.going.util.LoginUtils;
import jakarta.servlet.http.HttpSession;
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



    public void getReservation(ReservationRequestDTO dto, HttpSession session) {

        Reservation reservation = dto.toEntity();
        reservation.setUserId(LoginUtils.getCurrentLoginMemberId(session));

        reservationMapper.reservationSave(reservation);


    }

    public List<ReservationResponseDTO> getReservationList(Search page) {

        List<ReservationResponseDTO> dtoList = new ArrayList<>();

        List<Reservation> allReservation = reservationMapper.findAllReservation(page);

        for (Reservation reservation : allReservation) {

            ReservationResponseDTO dto = new ReservationResponseDTO(reservation);
            dtoList.add(dto);
        }

        return dtoList;

    }

    public int getCount2(Search page) {
        return reservationMapper.count2(page);
    }


}
