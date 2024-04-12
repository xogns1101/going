package com.camp.going.reservation;

import lombok.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eqq")
public class ReservationController {

    @GetMapping("/eee")
    public String show(){


        return null; // 임시 설정, 테스트 때 막혔어요
    }




}
