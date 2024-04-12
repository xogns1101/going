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
    @DisplayName("공지사항 2개 작성")
    void noticeInsertTest() {
        // given
        for (int i = 1; i <= 2; i++) {
            Notice notice = new Notice();
        }
        // when

        // then
    }

}