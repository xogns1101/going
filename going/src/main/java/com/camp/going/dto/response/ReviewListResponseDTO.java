package com.camp.going.dto.response;

import com.camp.going.common.PageMaker;
import lombok.*;

import java.util.List;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewListResponseDTO {

    private int count; // 리뷰 수
    private PageMaker pageInfo; // 페이징 정보
    
    private List<ReviewResponseDTO> reviews; // 실제 리뷰 리스트

}