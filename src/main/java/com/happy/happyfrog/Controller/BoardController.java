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
                       @RequestParam(defaultValue = "default") String sort, Model m){
        BoardDTO board;
        List<ReplyDTO> list;
        if(sort.equals("random")){
            board = boardDAO.searchListRandom();
            bno = board.getBno();
            list = dao.read(bno);
        }else{
            board = boardDAO.selectOne(bno);
            list = dao.read(bno);
        }
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
                ReplyDTO rDTO = new ReplyDTO();
                rDTO.setBno(bno); rDTO.setCommenter(uDto.getNickname());
                if(dao.replyCheck(rDTO) == null){ // 평점은 한번만 달게끔 한다.
                    m.addAttribute("replyCheck","ok");
                }
                m.addAttribute("writer", uDto.getNickname());
                // 로그인한 사용자만 리플 달기 가능
            }
        }

        return "read";
    }

    @RequestMapping("/")
    public String list(SearchDTO sd, Model m, @RequestParam(defaultValue = "default") String sort)
    {
        System.out.println("sd = " + sd);
        PagingDTO pagingDTO = new PagingDTO(boardDAO.searchCnt(sd),sd);
        // offset 공식 :  (page-1) * pagesize(10이 기본값)
        List<BoardDTO> list;
        if(sort.equals("default")){
            list = boardDAO.searchList(sd);
        }else if(sort.equals("read")){
            list = boardDAO.searchListRead(sd);
        }else{
            list = boardDAO.searchListRating(sd);
        }
        m.addAttribute("sort",sort);
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

    @PostMapping("/update")
    public String update(Integer bno, String title){
        BoardDTO dto = new BoardDTO();
        dto.setBno(bno);
        dto.setTitle(title);
        boardDAO.update(dto);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String delete(Integer bno){
        boardDAO.delete(bno);
        return "redirect:/";
    }




}
