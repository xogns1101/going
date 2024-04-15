package com.camp.going.mapper;

import com.camp.going.entity.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    void saveReview(Review review);

    void deleteReview(int reviewNo);

    List<Review> findAllReview();

}