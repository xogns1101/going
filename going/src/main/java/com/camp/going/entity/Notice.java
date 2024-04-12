package com.camp.going.entity;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {

    private int noticeNo; // 글번호
    private String noticeTitle; // 제목
    private String noticeContent; // 내용
    private String noticeDate; // 작성날짜

    public Notice(NoticeWriteRequestDTO dto) {

    }

}

/*
    SELECT
	    notice_no AS '글번호',
	    notice_title AS '제목',
	    notice_content AS '내용',
	    notice_date AS '작성날짜'
    FROM notice_detail;
 */