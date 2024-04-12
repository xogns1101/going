package com.camp.going.repository;

import com.camp.going.entity.Notice;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class NoticeRepositoryTest {

    @Autowired
    private NoticeRepository repository;

    @Test
    @DisplayName("공지사항 2개 작성하기")
    void noticeInsertTest() {
        // given
        for (int i = 1; i <= 2; i++) {
            Notice notice = new Notice();
            notice.setNoticeTitle("공지사항 " + i + "번 제목 테스트");
            notice.setNoticeContent("공지사항 " + i + "번 내용 테스트");
            repository.save(notice);
        }
        // when

        // then
    }

}