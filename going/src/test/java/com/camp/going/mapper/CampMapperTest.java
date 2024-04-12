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

    @Test
    @DisplayName("캠핑장 등록에 성공할것")
    void campSaveTest() {
        // given
        
        // when
        Camping build = Camping.builder()
                .campId(1)
                .campName("에뜨유명산캠핑장")
                .campAddress("경기도 가평군 설악면 가일리 235-4")
                .campNumber("031-585-4648")
                .campHomepage("http//:cafe.naver.com/atyumyeongsan")
                .campElectric("전기 사용가능")
                .campHotWater("온수 사용가능")
                .campWifi("wifi 사용가능")
                .campFirewood("장작판매")
                .campMart("마트 없음")
                .campBed("글램핑 침대 미보유")
                .campIceBox("글램핑 냉장고 미보유")
                .campPrice(80000)
                .campImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnKIfOrWYgA9kBzDePUy8qs5E7RLRptI8FaA&s")
                .build();
            campingMapper.campSave(build);

        // then
    }
    
    
}