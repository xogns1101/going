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
    private int nno; // 수정할 공지 글 번호
    @NotBlank
    private String title; // 수정할 공지 제목
    @NotBlank
    private String content; // 수정할 공지 내용


    public Notice toEntity() {
        return Notice.builder()
                .noticeNo(nno)
                .noticeTitle(title)
                .noticeContent(content)
                .build();
    }

}
