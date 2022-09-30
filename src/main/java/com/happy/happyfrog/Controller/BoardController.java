package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.PagingDTO;
import com.happy.happyfrog.DTO.SearchDTO;
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

//    @RequestMapping("/")
//    public String list(@RequestParam(defaultValue = "1") Integer page, Model m)
//    {
//        PagingDTO pagingDTO = new PagingDTO(boardDAO.count(),page);
//        int offset = (page-1) * 10;  // (page-1) * pagesize(10이 기본값)
//        List<BoardDTO> list = boardDAO.selectPage(offset);
//        m.addAttribute("board",list);
//        m.addAttribute("pageDTO",pagingDTO);
//        return "index";
//
//    }

    @RequestMapping("/")
    public String list(SearchDTO sd, Model m)
    {
        System.out.println("sd = " + sd);
        PagingDTO pagingDTO = new PagingDTO(boardDAO.searchCnt(sd),sd);
        // offset 공식 :  (page-1) * pagesize(10이 기본값)
        List<BoardDTO> list = boardDAO.searchList(sd);
        m.addAttribute("board",list);
        m.addAttribute("pageDTO",pagingDTO);
        return "index";

    }
}
