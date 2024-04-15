package com.camp.going.mapper;

import com.camp.going.entity.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    void saveReview(Review review); // 리뷰 쓰기

    void deleteReview(int reviewNo); // 리뷰 삭제

    List<Review> findAllReview(); // 모든 리뷰

    void modifyReview(Review review); // 리뷰 수정

    void countReview(int reviewNo); // 리뷰 조회수

    Review bestReview(); // 베스트 리뷰

}