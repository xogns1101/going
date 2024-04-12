package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CampingMapper {

    void campSave(Camping camp);

    // 단일 정보 조회
    Camping findCamping(int campId);

    List<Camping> findAllCamping();



}
