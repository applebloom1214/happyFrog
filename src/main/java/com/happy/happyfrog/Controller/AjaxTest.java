package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DTO.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AjaxTest {

    @GetMapping("/ajax")
    public String ajax(){
        return "ajaxtest";
    }

    @PostMapping("/send")
    @ResponseBody
    public Person send(@RequestBody Person person){
        System.out.println("person = " + person);


        return person;
    }

}
