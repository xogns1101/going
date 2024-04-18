package com.camp.going.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

    @RequestMapping(value = "/error/403", method = RequestMethod.GET)
    public String error403() {
        return "error/403";
    }

    @RequestMapping(value = "/error/404", method = RequestMethod.GET)
    public String error404() {
        return "error/404";
    }

    @RequestMapping(value = "/error/500", method = RequestMethod.GET)
    public String error500() {
        return "error/500";
    }
}