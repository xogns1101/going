package com.camp.going.dto.request;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
public class NoticeWriteRequestDTO {

    private String noticeTitle;
    private String noticeContent;

}
