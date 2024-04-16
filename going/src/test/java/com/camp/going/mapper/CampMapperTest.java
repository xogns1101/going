package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CampMapperTest {

    @Autowired
    CampingMapper campingMapper;

    // 캠핑장 등록
    @Test
    @DisplayName("캠핑장 등록에 성공할것")
    void campSaveTest() {
        // given
        
        // when
        Camping build = Camping.builder()
                .campId(2)
                .campName("홀리데이캠핑장")
                .campAddress("경기도 가평군 설악면 가일리 180-14")
                .campNumber("0507-1311-8513")
                .campHomepage("blog.naver.com/holidaycamp1")
                .campElectric("전기 사용가능")
                .campHotWater("온수 사용가능")
                .campWifi("wifi 사용가능")
                .campFirewood("장작판매")
                .campMart("마트 없음")
                .campBed("글램핑 침대 미보유")
                .campIceBox("글램핑 냉장고 미보유")
                .campPrice(75000)
                .campImage("https://search.pstatic.net/sunny/?src=https%3A%2F%2Fgocamping.or.kr%2Fupload%2Fcamp%2F7233%2Fthumb%2Fthumb_1000_1441UnDsjwUv1N2Q4i4PXo48.jpg&type=a340")
                .build();
            campingMapper.campSave(build);

        // then
    }
    
    
}