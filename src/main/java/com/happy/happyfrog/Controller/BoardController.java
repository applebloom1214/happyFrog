package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.PagingDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardDAO boardDAO;

    @RequestMapping("/")
    public String list(@RequestParam(defaultValue = "1") int page, Model m)
    {
        PagingDTO pagingDTO = new PagingDTO(boardDAO.count(),page);
        List<BoardDTO> list = boardDAO.select10();
        int offset = (page-1) * 10;  // (page-1) * pagesize(10이 기본값)
        m.addAttribute("board",list);
        m.addAttribute("pageDTO",pagingDTO);
        return "index";

    }
}
