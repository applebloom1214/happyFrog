package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.PagingDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.DTO.SearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardDAO boardDAO;
    @Autowired
    private ReplyDAO dao;

    @GetMapping("/read")
    public String read(@RequestParam(defaultValue = "0") Integer bno, Model m){
        List<ReplyDTO> list = dao.read(bno);
        m.addAttribute("reply",list);
        return "read";
    }

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
