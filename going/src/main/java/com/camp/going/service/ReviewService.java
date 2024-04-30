package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.request.ReservationRequestDTO;
import com.camp.going.dto.request.ReviewModifyRequestDTO;
import com.camp.going.dto.request.ReviewRequestDTO;
import com.camp.going.dto.response.ReviewResponseDTO;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.Review;
import com.camp.going.mapper.ReviewMapper;
import com.camp.going.util.LoginUtils;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.camp.going.util.LoginUtils.getCurrentLoginMemberAccount;

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

    public int getCount(Search page) {
        return reviewMapper.getCount(page);
    }

    public void register(ReviewRequestDTO dto, String savePath, HttpSession session) {
        Review review = dto.toEntity(savePath);
        review.setEmail(getCurrentLoginMemberAccount(session));

        reviewMapper.saveReview(review);
    }

    public void modify(ReviewModifyRequestDTO dto, String savePath) {
        Review review = dto.toEntity(savePath);
        reviewMapper.modifyReview(review);
    }

    public ReviewResponseDTO getDetail(int rno) {
        return new ReviewResponseDTO(reviewMapper.findOne(rno));
    }

    public Review bestReview() {
        return reviewMapper.bestReview();
    }

}
