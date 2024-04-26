package com.camp.going.controller;

import com.camp.going.dto.response.CampingDetailResponseDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.dto.response.ReservationResponseDTO;
import com.camp.going.entity.Camping;
import com.camp.going.entity.MyPage;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.mapper.ReservationMapper;
import com.camp.going.service.CampingService;
import com.camp.going.service.MyPageService;
import com.camp.going.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class MyPageController {

    private final MyPageService myPageService;

    private final CampingService service;

    private final ReservationMapper reservationMapper;


    @GetMapping("/mypage")
    public String showMypage(Model model, HttpSession session, User user, Reservation reservation){



        LoginUserResponseDTO dto = (LoginUserResponseDTO) session.getAttribute("login");
        user.setUserId((int) dto.getId());
        user.setName(dto.getName());
        log.info("user_id : {}", user.getUserId());
        log.info("name : {}", user.getName());

        //reservationMapper.reservationSave(reservation);

        MyPage myPage = myPageService.myReservation(dto.getId());

        model.addAttribute("r", dto);
        model.addAttribute("c",myPage);

        return "mypage";

    }



}
