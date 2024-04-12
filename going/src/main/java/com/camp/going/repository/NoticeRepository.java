package com.camp.going.repository;

import com.camp.going.entity.Notice;

// 공지사항 기능

public interface NoticeRepository {

    // 공지사항 등록
    void save(Notice notice);

}
