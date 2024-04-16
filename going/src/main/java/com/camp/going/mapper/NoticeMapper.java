package com.camp.going.mapper;

import com.camp.going.common.Search;
import com.camp.going.entity.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    // 목록 조회
    List<Notice> findAll(Search page);

    // 상세 조회
    Notice findOne(int noticeNo);

    // 저장
    void save(Notice notice);
    
    // 수정
    void modify(Notice notice);

    // 조회수
    void updateViewCount(int noticeNo);

    // 삭제
    void delete(int noticeNo);

    int getCount(Search page);

}
