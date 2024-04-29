package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.response.CampingListResponseDTO;
import com.camp.going.dto.response.CampingDetailResponseDTO;
import com.camp.going.dto.response.ReservationResponseDTO;
import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.mapper.CampingMapper;
import com.camp.going.mapper.ReservationMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CampingService {

    private final CampingMapper campingMapper;
    private final ReservationMapper reservationMapper;



    // 캠핑장 목록 서비스
    public List<CampingListResponseDTO> getList(Search page) {

        List<CampingListResponseDTO> dtoList = new ArrayList<>();
        List<Camping> campingList = campingMapper.findAllCamping(page);

        for (Camping camping : campingList) {

            CampingListResponseDTO dto = new CampingListResponseDTO(camping);
            dtoList.add(dto);

        }
        return dtoList;

    }

    // 캠핑장 목록 페이징 작업
    public int getCount(Search page) {
        return campingMapper.getCount(page);
    }

    // 캠핑장 예약 관련 서비스
    public CampingDetailResponseDTO reservationDetail(int campId, Reservation reservation) {

        Camping camping = campingMapper.findCamping(campId);



        return new CampingDetailResponseDTO(camping, reservation);
    }


    // 예약 현황 리스트 목록
//    public List<ReservationResponseDTO> getReservationList(Camping camping, User user) {
//
//        List<ReservationResponseDTO> dtoList = new ArrayList<>();
//
//        List<Reservation> reservations = reservationMapper.reservationCamping();
//
//        for (Reservation reservation : reservations) {
//
//            ReservationResponseDTO dto = new ReservationResponseDTO(reservation, camping, user);
//
//            dto.setEmail(user.getEmail());
//            dto.setCampName(camping.getCampName());
//            dto.setRegDate(String.valueOf(reservation.getRegDate()));
//            dto.setPhoneNumber(user.getPhoneNumber());
//
//            dtoList.add(dto);
//
//        }
//
//        return dtoList;
//
//    }


    public Camping getCampingById(int campId){
        return  campingMapper.selectCampingById(campId);
    }



}

