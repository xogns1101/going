package com.camp.going.repository;

import com.camp.going.entity.Notice;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class NoticeRepositoryTest {

    @Autowired
    private NoticeRepository repository;

    @Test
    @DisplayName("공지사항 200개 작성하기")
    void noticeInsertTest() {
        // given
        for (int i = 1; i <= 200; i++) {
            Notice notice = new Notice();
            notice.setNoticeTitle("공지사항 " + i + "번 제목 테스트");
            notice.setNoticeContent("공지사항 " + i + "번 내용 테스트");
            notice.setNoticeDate(LocalDateTime.now());
            repository.save(notice);
        }
        // when

        // then
    }

    @Test
    @DisplayName("공지사항을 전체 조회하면 199개의 글이 조회됨")
    void findAllTest() {
        // given

        // when
        List<Notice> noticeList = repository.findAll();
        // then
        assertEquals(199, noticeList.size());
    }

    @Test
    @DisplayName("1번 게시글을 단일 조회하면 제목에 1가 포함되어 있어야 함")
    void findOneTest() {
        // given
        int noticeNo = 1;
        // when
        Notice notice = repository.findOne(noticeNo);
        // then
        assertTrue(notice.getNoticeTitle().contains("1"));
    }

    @Test
    @DisplayName("2번 게시글을 삭제하고 다시 조회하면 조회되지 않아야 함")
    void deleteTest() {
        // given
        int noticeNo = 2;
        // when
        repository.delete(noticeNo);
        Notice notice = repository.findOne(noticeNo);
        // then
        assertNull(notice);
    }

    @Test
    @DisplayName("3번 게시글의 내용 수정")
    void modifyTest() {
        // given
        int noticeNo = 3;
        Notice modifiedNotice = repository.findOne(noticeNo);
        modifiedNotice.setNoticeTitle("수정된 제목 3");
        modifiedNotice.setNoticeContent("수정된 내용 3");
        modifiedNotice.setNoticeCategory("ESSENTIAL");

        // when
        repository.modify(modifiedNotice);

        // then
        Notice retrievedNotice = repository.findOne(noticeNo);
        Assertions.assertEquals("수정된 제목 3", retrievedNotice.getNoticeTitle());
        Assertions.assertEquals("수정된 내용 3", retrievedNotice.getNoticeContent());
        Assertions.assertEquals("ESSENTIAL", retrievedNotice.getNoticeCategory());
    }

    @Test
    @DisplayName("3번 게시글을 단일 조회하면 제목에 '수정'이 포함되어 있어야 함")
    void findOneTest2() {
        // given
        int noticeNo = 3;
        // when
        Notice notice = repository.findOne(noticeNo);
        // then
        assertTrue(notice.getNoticeTitle().contains("수정"));
    }

    @Test
    @DisplayName("201번 게시글을 카테고리 NOTICE까지 넣어서 작성해본다")
    void noticeInsertTest2() {
        // given
        for (int i = 201; i <= 201; i++) {
            Notice notice = new Notice();
            notice.setNoticeTitle("공지사항 " + i + "번 제목 테스트");
            notice.setNoticeContent("공지사항 " + i + "번 내용 테스트");
            notice.setNoticeCategory("NOTICE");
            repository.save(notice);
        }
        // when

        // then
    }

    @Test
    @DisplayName("공지사항 번호 200까지의 게시글의 카테고리를 ESSENTIAL, NOTICE, COMMON 셋 중 하나로 무작위로 바꾼다")
    void noticeCategoryModifyTest() {
        // given
        Random random = new Random();
        List<String> categories = Arrays.asList("ESSENTIAL", "NOTICE", "COMMON");

        for (int i = 1; i <= 200; i++) {
            String randomCategory = categories.get(random.nextInt(categories.size()));

            Notice notice = repository.findOne(i);
            if (notice != null) {
                notice.setNoticeCategory(randomCategory);
                repository.modify(notice);
            }
        }
        // when

        // then

    }

    @Test
    @DisplayName("1번 공지사항 조회수 올리기")
    void noticeCountTest() {
        // given
        int noticeNo = 1;

        // when
        repository.updateViewCount(noticeNo);
        // then
        Notice updatedNotice = repository.findOne(noticeNo);
        Assertions.assertNotNull(updatedNotice); // 공지사항이 존재하는지 확인
        Assertions.assertEquals(1, updatedNotice.getNoticeCount()); // 조회수가 1 증가했는지 확인
    }

}

