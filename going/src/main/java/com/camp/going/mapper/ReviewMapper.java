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

    void likeReview(int reviewNo); // 리뷰 좋아요

    int maxLike();

    Review bestReview(); // 베스트 리뷰 (좋아요가 가장 많은 것 -> 좋아요 수가 같을 경우 최신에 작성된 글)

    int updateLikeCount(int rno); // 리뷰 좋아요 처리
    
    int cancelLikeCount(int rno); // 리뷰 좋아요 취소 처리

    // 총 리뷰 수 리턴
    int getCount(Search page); // 총 리뷰 수 리턴

    Review findOne(int reviewNo); // 하나의 리뷰 보기

}
