package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.*;
import com.happy.happyfrog.DTO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private UserDAO uDao;

    @GetMapping("/read")
    public String read(@RequestParam(defaultValue = "0") Integer bno, @RequestParam(defaultValue = "guest") String id,
                       Model m){
        BoardDTO board = boardDAO.selectOne(bno);
        List<ReplyDTO> list = dao.read(bno);
        boardDAO.updateHits(bno);
        m.addAttribute("reply",list);
        m.addAttribute("bno",bno);
        m.addAttribute("title",board.getTitle());
        m.addAttribute("rating",board.getRating());
        if(!id.equals("guest")){
            UserDTO uDto = uDao.read(id);
            if(board.getWriter().equals(uDto.getNickname())){
                m.addAttribute("writerCheck","ok");
                // 글쓴이만 삭제, 수정 버튼 사용 가능
            }else{
                m.addAttribute("replyCheck","ok");
                // 로그인한 사용자만 리플 달기 가능
            }
        }

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
        m.addAttribute("finedust",new APIDAO().getFinddust());
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
