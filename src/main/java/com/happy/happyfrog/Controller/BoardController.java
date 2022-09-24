package com.happy.happyfrog.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

    @RequestMapping("/")
    public String list(){
        return "index";
    }
}
