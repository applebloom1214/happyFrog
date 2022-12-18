package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.*;
import com.happy.happyfrog.DTO.*;
import com.happy.happyfrog.Service.BoardService;
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
    private BoardService boardService;

    @GetMapping("/read")
    public String read(@RequestParam(defaultValue = "0") Integer bno, @RequestParam(defaultValue = "guest") String id,
                       @RequestParam(defaultValue = "default") String sort, Model m){
        BoardDTO board;
        List<ReplyDTO> list;
        if(sort.equals("random")){
            board = boardService.getRandomList();
            bno = board.getBno();
            list = boardService.getReplyList(bno);
        }else{
            board = boardService.getOneList(bno);
            list = boardService.getReplyList(bno);
        }
        boardService.updateHits(bno);
        m.addAttribute("reply",list);
        m.addAttribute("bno",bno);
        m.addAttribute("title",board.getTitle());
        m.addAttribute("rating",board.getRating());
        if(!id.equals("guest")){
            UserDTO uDto = boardService.getUser(id);
            if(board.getWriter().equals(uDto.getNickname())){
                m.addAttribute("writerCheck","ok");
                // 글쓴이만 삭제, 수정 버튼 사용 가능
            }else{
                ReplyDTO rDTO = new ReplyDTO();
                rDTO.setBno(bno); rDTO.setCommenter(uDto.getNickname());
                if(boardService.CheckReply(rDTO) == null){ // 평점은 한번만 달게끔 한다.
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
        PagingDTO pagingDTO = new PagingDTO(boardService.searchCnt(sd),sd);
        // offset 공식 :  (page-1) * pagesize(10이 기본값)
        List<BoardDTO> list;
        if(sort.equals("default")){
            list = boardService.searchList(sd);
        }else if(sort.equals("read")){
            list = boardService.searchListRead(sd);
        }else{
            list = boardService.searchListRating(sd);
        }
        m.addAttribute("sort",sort);
        m.addAttribute("board",list);
        m.addAttribute("pageDTO",pagingDTO);
        m.addAttribute("finedust",new APIDAOImpl().getFinddust());
        return "index";
    }

    @RequestMapping("/loadimg")
    public String showImg(@RequestParam(value = "bno") String bno, HttpServletResponse response) throws Exception{
        response.setContentType("image/jpg");
        ServletOutputStream sos = response.getOutputStream();
        FileDTO dto =boardService.readFile((Integer.parseInt(bno)));
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
        boardService.update(dto);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String delete(Integer bno){
        boardService.delete(bno);
        return "redirect:/";
    }




}
