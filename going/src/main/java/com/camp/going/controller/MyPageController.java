package com.camp.going.controller;

import com.camp.going.entity.MyPage;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.mapper.ReservationMapper;
import com.camp.going.service.CampingService;
import com.camp.going.service.MyPageService;
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

    private final MyPageService myPageService;

    }


}
