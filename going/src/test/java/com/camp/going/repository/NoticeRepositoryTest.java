package com.camp.going.repository;

import com.camp.going.entity.Notice;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

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

    @Test
    @DisplayName("공지사항을 전체 조회하면 2개의 글이 조회됨")
    void findAllTest() {
        // given

        // when
        List<Notice> noticeList = repository.findAll();
        // then
        assertEquals(2, noticeList.size());
    }

    @Test
    @DisplayName("2번 게시글을 단일 조회하면 제목에 2가 포함되어 있어야 함")
    void findOneTest() {
        // given
        int noticeNo = 2;
        // when
        Notice notice = repository.findOne(noticeNo);
        // then
        assertTrue(notice.getNoticeTitle().contains("2"));
    }

    @Test
    @DisplayName("1번 게시글을 삭제하고 다시 조회하면 조회되지 않아야 함")
    void deleteTest() {
        // given
        int noticeNo = 1;
        // when
        repository.delete(noticeNo);
        Notice notice = repository.findOne(noticeNo);
        // then
        assertNull(notice);
    }

}

















