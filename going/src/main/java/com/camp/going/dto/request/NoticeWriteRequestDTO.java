package com.camp.going.dto.request;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeWriteRequestDTO {

    private String noticeTitle;
    private String noticeContent;
    private String noticeCategory;

}
