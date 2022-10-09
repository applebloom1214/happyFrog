package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DTO.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/read/replies/")
@RestController
public class ReplyController {
    @Autowired
    private ReplyDAO dao;

    @GetMapping("/")
    public ResponseEntity<List<ReplyDTO>> list(){
        int bno = 0;
        List<ReplyDTO> list = dao.read(bno);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }


    @PostMapping("/")
    public ResponseEntity<String> write(@RequestBody ReplyDTO dto){
        System.out.println("dto.getReply() = " + dto.getReply());
        System.out.println("dto = " + dto);
        String commenter = "테스트중";
        dto.setCommenter(commenter);
        if(dao.insert(dto) == 1){
            return new ResponseEntity<>("ADD_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("ADD_FAIL", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/{cno}")
    public ResponseEntity<String> delete(@PathVariable Integer cno){
        if(dao.delete(cno) ==1){
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("DEL_FAIL", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/{cno}")
    public ResponseEntity<String> update(@PathVariable Integer cno, @RequestBody ReplyDTO dto){
        if(dao.update(dto) ==1){
            return new ResponseEntity<>("DOD_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("MOD_FAIL", HttpStatus.BAD_REQUEST);

        }
    }


}
