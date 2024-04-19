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
                .campId(3)
                .campName("신난다캠핑장")
                .campAddress("경기도 가평군 설악면 가일리 150-20")
                .campNumber("0578-1211-1513")
                .campHomepage("blog.naver.com/tlssksek")
                .campElectric("전기 사용가능")
                .campHotWater("온수 사용가능")
                .campWifi("wifi 사용가능")
                .campFirewood("장작판매")
                .campMart("마트 없음")
                .campBed("글램핑 침대 미보유")
                .campIceBox("글램핑 냉장고 미보유")
                .campPrice(80000)
                .campImage("https://search.pstatic.net/sunny/?src=https%3A%2F%2Fgocamping.or.kr%2Fupload%2Fcamp%2F7233%2Fthumb%2Fthumb_1000_1441UnDsjwUv1N2Q4i4PXo48.jpg&type=a340")
                .build();
            campingMapper.campSave(build);

        // then
    }
    
    
}