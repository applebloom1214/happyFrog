package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardDAO boardDAO;

    @RequestMapping("/")
    public String list(Model m)
    {
        List<BoardDTO> list = boardDAO.select10();
        m.addAttribute("board",list);
        return "index";

    }
}
