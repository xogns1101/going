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
    Notice findOne(int nno);

    // 저장
    void save(Notice notice);

    // 조회수
    void updateViewCount(int nno);

    // 삭제
    void delete(int nno);

    int getCount(Search page);
}
