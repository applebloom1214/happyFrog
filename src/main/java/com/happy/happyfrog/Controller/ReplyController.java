package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DTO.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReplyController {
    @Autowired
    private ReplyDAO dao;

    @PostMapping("/read/adds")
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
}
