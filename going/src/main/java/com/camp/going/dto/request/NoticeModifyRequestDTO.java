package com.camp.going.dto.request;

import com.camp.going.entity.Notice;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeModifyRequestDTO {

    @NotNull
    private int noticeNo; // 수정할 공지 글 번호
    @NotBlank
    private String noticeTitle; // 수정할 공지 제목
    @NotBlank
    private String noticeContent; // 수정할 공지 내용
    @NotBlank
    private String noticeCategory; // 수정할 카테고리


    public Notice toEntity() {
        return Notice.builder()
                .noticeNo(noticeNo)
                .noticeTitle(noticeTitle)
                .noticeContent(noticeContent)
                .noticeCategory(noticeCategory)
                .build();
    }

}
