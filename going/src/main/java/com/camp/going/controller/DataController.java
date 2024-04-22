package com.camp.going.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class DataController {

    @GetMapping("data")
    public String data(){

        return "date";
    }
}
