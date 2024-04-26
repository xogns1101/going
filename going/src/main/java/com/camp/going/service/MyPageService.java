package com.camp.going.service;

import com.camp.going.dto.request.MyPageRequestDTO;
import com.camp.going.entity.MyPage;
import com.camp.going.mapper.MyPageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyPageService {


    private final MyPageMapper myPageMapper;

    public void modifyName(MyPageRequestDTO dto){

    };

    public MyPage myReservation(long id) {


        return myPageMapper.myReservation((int) id);


    }


}