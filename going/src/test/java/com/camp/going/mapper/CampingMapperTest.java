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
    
    @Test
    @DisplayName("삭제가 잘 되는지 테스트")
    void campDeleteTest() {
        // given
        int campId = 2;
        // when
        campingMapper.deleteCamping(campId);
        List<Camping> campingList = campingMapper.findAllCamping();
        // then
        assertEquals(1, campingList.size());

    }

    @Test
    @DisplayName("수정 잘 되는 지 테스트")
    void updateCamping() {
        // given
        int campId = 1;
        Camping camping = Camping.builder()
                .campId(campId)
                .campName("두레캠핑장")
                .campAddress("경기도 가평군 청평면 상천리 1494")
                .campNumber("정보없음")
                .campHomepage("cafe.naver.com/dooraecamp")
                .campElectric("전기 사용가능")
                .campHotWater("온수 사용가능")
                .campWifi("wifi 사용가능")
                .campFirewood("장작판매")
                .campMart("마트 없음")
                .campBed("글램핑 침대 미보유")
                .campIceBox("글램핑 냉장고 미보유")
                .campPrice(70000)
                .campImage("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMjFfMjI3%2FMDAxNjM3NDk0MjUzMDUw.NQMMFR9s86qh1qwOL_A22iU5QXjAGcLiTb-tejQpHM4g.brnrzYkz1tf9ikkSh5hxnc2bsP64CGz6FJ2NcRB4YL0g.JPEG.seri9258%2F20211105%25A3%25DF154017.jpg&type=a340")
                .build();
        // when
        campingMapper.updateCamping(camping);
        Camping camping1 = campingMapper.findCamping(campId);
        // then
        assertEquals(camping, camping1);
    }
    

}