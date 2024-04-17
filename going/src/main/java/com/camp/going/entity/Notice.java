package com.camp.going.entity;

import com.camp.going.dto.request.NoticeWriteRequestDTO;
import lombok.*;

import java.time.LocalDateTime;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {

    private int noticeNo; // 글번호
    private String noticeTitle; // 제목
    private String noticeContent; // 내용
    private LocalDateTime noticeDate; // 작성날짜
    private int noticeCount; // 조회수
    private String noticeCategory; // 카테고리

    public Notice(NoticeWriteRequestDTO dto) {
        this.noticeTitle = dto.getNoticeTitle();
        this.noticeContent = dto.getNoticeContent();
        this.noticeCategory = dto.getNoticeCategory();
    }

    public enum Category {
        ESSENTIAL, NOTICE, COMMON
        //  필독,    공지,   일반
    }

}

/*
    SELECT
	    notice_no AS '글번호',
	    notice_title AS '제목',
	    notice_content AS '내용',
	    notice_date AS '작성날짜',
        notice_count AS '조회수'
    FROM notice_detail;
 */