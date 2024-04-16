package com.camp.going.mapper;

import com.camp.going.common.Search;
import com.camp.going.entity.Camping;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CampingMapper {

    // 캠핑 등록
    void campSave(Camping camp);

    // 단일 정보 조회
    Camping findCamping(int campId);

    // 캠핑 전체 조회
    List<Camping> findAllCamping(Search page);

    // 삭제
    void deleteCamping(int campId);

    void updateCamping(Camping camping);

  //  int getCount(Search page);



}
