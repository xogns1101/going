package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Review;
import com.camp.going.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewMapper reviewMapper;

    public List<ReviewResponseDTO> getList(Search page) {
        List<ReviewResponseDTO> dtoList = new ArrayList<>();
        List<Review> reviewList = reviewMapper.findAllReview(page);
        for (Review review : reviewList) {
            ReviewResponseDTO dto = new ReviewResponseDTO(review);
            dtoList.add(dto);
        }
        return dtoList;
    }

    public void delete(int rno) {
        reviewMapper.deleteReview(rno);
    }

    public int getLike(int rno) {
        return reviewMapper.updateLikeCount(rno);
    }

    public int getCount(Search page) {
        return reviewMapper.getCount(page);
    }

}
