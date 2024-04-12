package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CampingMapper {

    void campSave(Camping camp);




}
