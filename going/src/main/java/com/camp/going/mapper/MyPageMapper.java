package com.camp.going.mapper;

import com.camp.going.entity.Camping;
import com.camp.going.entity.MyPage;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {

    void modifyName(User user); // 이름 수정

    void modifyPhoneNumber(User user); // 휴대폰번호 수정

    void modifyPassword(User user); // 비밀번호 수정

    List<MyPage> confirmReservation(String email); // 예약 내용 확인

    MyPage myReservation(int userId);



}