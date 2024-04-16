package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.response.CampingListResponseDTO;
import com.camp.going.entity.Camping;
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

    public List<CampingListResponseDTO> getList(Search page) {

        List<CampingListResponseDTO> dtoList = new ArrayList<>();
        List<Camping> campingList = campingMapper.findAllCamping(page);

        for (Camping camping : campingList) {

            CampingListResponseDTO dto = new CampingListResponseDTO(camping);
            dtoList.add(dto);

        }
        return dtoList;

    }

    public int getCount(Search page) {
        return campingMapper.getCount(page);
    }

    public void reservationOne(int campId) {

        Camping camping = campingMapper.findCamping(campId);



    }
}
