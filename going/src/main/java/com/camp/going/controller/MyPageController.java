package com.camp.going.controller;

import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.service.CampingService;
import com.camp.going.service.UserService;
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

    private final CampingService service;

    private final UserService userService;

//    @GetMapping("/mypage")
//
//    public String myPage(Model model, int campId, String email) {
//
//        User user = userService.getFindUser(email);
//
//        Reservation reservation = service.getReservation(campId);
//
//        log.info("확인 : {}", reservation.getCampName());
//
//        model.addAttribute("r", reservation);
//
//        return "mypage";
//
//    }

    @GetMapping("/mypage")
    public String myPage() {
        log.info("/user/mypage : GET!");




        return "mypage";

    }

}
