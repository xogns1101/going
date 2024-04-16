package com.camp.going.entity;

import lombok.*;

@Getter @ToString @Setter
@EqualsAndHashCode @AllArgsConstructor @NoArgsConstructor
@Builder
public class Camping {

    private int campId; // 캠핑장 고유 번호
    private String campName; // 캠팡장 이름
    private String campAddress; // 캠팡장 주소
    private String campNumber; // 캠핑장 전화 번호
    private String campHomepage; // 캠핑장 홈페이지
    private String campElectric; // 전기 사용 여부
    private String campHotWater; // 온수 사용 여부
    private String campWifi; // 와이파이 사용 여부
    private String campFirewood; // 장작 판매 관련
    private String campMart; // 근처 마트 여부
    private String campBed; // 침대 여부
    private String campIceBox; // 냉장고 여부
    private int campPrice; // 캠핑장 가격
    private String campImage; // 캠핑장 이미지 사진








}
