package com.camp.going.mapper;

import com.camp.going.common.Search;
import com.camp.going.entity.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    void saveReview(Review review); // 리뷰 쓰기

    void deleteReview(int reviewNo); // 리뷰 삭제

    List<Review> findAllReview(Search page); // 모든 리뷰

    void modifyReview(Review review); // 리뷰 수정

    Review bestReview(); // 메인 화면에 보이는 가장 최신 리뷰

    // 총 리뷰 수 리턴
    int getCount(Search page); // 총 리뷰 수 리턴

    Review findOne(int reviewNo); // 하나의 리뷰 보기

}
