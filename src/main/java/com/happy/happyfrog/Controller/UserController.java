package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @Autowired
    UserDAO dao;

    @GetMapping("/signin")
    public String signin(){
        return "signin";
    }

    @PostMapping("/signin")
    public String signinCheck(UserDTO dto){
        System.out.println("dto = " + dto);
        dao.insert(dto);
        return "redirect:/";
    }

}
