package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CampingMapperTest {

    @Autowired
    CampingMapper campingMapper;

    @Test
    @DisplayName("campId 가 1인 id를 조회하면 캠핑장의 이름이 에뜨유명산캠핑장 여야함")
    void findCampingTest() {
        // given
        int campId = 1;
        // when
        Camping camping = campingMapper.findCamping(campId);

        // then
        assertEquals(camping.getCampName(), "에뜨유명산캠핑장");
    }

    @Test
    @DisplayName("캠핑장 목록이 1개 있어야 함")
    void findAllTest() {
        // given

        // when
        List<Camping> campingList = campingMapper.findAllCamping();
        // then
        assertEquals(1, campingList.size());

    }


}