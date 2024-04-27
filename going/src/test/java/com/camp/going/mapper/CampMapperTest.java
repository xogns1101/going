package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import com.camp.going.repository.CampingRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

@SpringBootTest
class CampMapperTest {

    @Autowired
    CampingMapper campingMapper;

    @Autowired
    CampingRepository campingRepository;

    // 캠핑장 등록
    @Test
    @DisplayName("캠핑장 등록에 성공할것")
    void campSaveTest() {
        // given
        
        // when
        Camping build = Camping.builder()
                .campId(11)
                .campName("냠냠캠핑장")
                .campAddress("경기도 가평군 설악면 가일리 150-20")
                .campNumber("0578-1211-1513")
                .campHomepage("blog.naver.com/tlssksek")
                .campElectric("전기 사용불가능")
                .campHotWater("온수 사용불가능")
                .campWifi("wifi 사용가능")
                .campFirewood("장작판매")
                .campMart("마트 없음")
                .campBed("글램핑 침대 보유")
                .campIceBox("글램핑 냉장고 미보유")
                .campPrice(80000)
                .campImage("https://search.pstatic.net/sunny/?src=https%3A%2F%2Fgocamping.or.kr%2Fupload%2Fcamp%2F7233%2Fthumb%2Fthumb_1000_1441UnDsjwUv1N2Q4i4PXo48.jpg&type=a340")
                .build();
            campingMapper.campSave(build);

        // then
    }
    
    @Test
    @DisplayName("캠핑장 146개 가격 붙이기")
    void campingPrice() {
        Random random = new Random();
        List<Integer> prices = Arrays.asList(50000, 55000, 60000, 65000, 70000, 75000, 80000, 85000, 90000, 95000, 100000);

        for (int i = 1; i <= 146; i++) {
            int randomPrices = prices.get(random.nextInt(prices.size()));

            int randomPrice = prices.get(random.nextInt(prices.size()));
            campingRepository.updateCampingPrice(i, randomPrice);
        }
    }
    
    
}