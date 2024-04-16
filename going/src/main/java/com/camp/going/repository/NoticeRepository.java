package com.camp.going.repository;

import com.camp.going.entity.Notice;

import java.util.List;

// 공지사항 기능

public interface NoticeRepository {

    void save(Notice notice);

    List<Notice> findAll();

    Notice findOne(int noticeNo);

    void delete(int noticeNo);

    void modify(Notice notice);
}
