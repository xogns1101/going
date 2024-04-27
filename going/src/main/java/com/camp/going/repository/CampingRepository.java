package com.camp.going.repository;

public interface CampingRepository {

    void updateCampingPrice(int campId, int price);

    void updateCampingImage(int campId, String image);

}
