package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.FileDAO;
import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DTO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardDAO boardDAO;
    @Autowired
    private ReplyDAO dao;
    @Autowired
    private FileDAO fdao;

    @GetMapping("/read")
    public String read(@RequestParam(defaultValue = "0") Integer bno, Model m){
        List<ReplyDTO> list = dao.read(bno);
        m.addAttribute("reply",list);
        m.addAttribute("bno",bno);
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

    @RequestMapping("/loadimg")
    public String showImg(@RequestParam(value = "bno") String bno, HttpServletResponse response) throws Exception{
        response.setContentType("image/jpg");
        ServletOutputStream sos = response.getOutputStream();
        FileDTO dto =fdao.read((Integer.parseInt(bno)));
        String imgPath = dto.getUploadPath()+"/"+dto.getUuid()+"_"+dto.getFileName();
        System.out.println("imgPath = " + imgPath);
        FileInputStream input = new FileInputStream(imgPath);
        int length;
        byte[] buffer = new byte[10];
        while((length=input.read(buffer)) != -1){
            sos.write(buffer,0,length);
        }
        return null;
    }
}
