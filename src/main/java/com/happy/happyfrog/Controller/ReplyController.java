package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.Service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/read/replies/")
@RestController
public class ReplyController {

    @Autowired
    ReplyService replyService;

    @GetMapping("/{bno}")
    public ResponseEntity<List<ReplyDTO>> list(@PathVariable Integer bno){
        List<ReplyDTO> list = replyService.read(bno);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }


    @PostMapping("/")
    public ResponseEntity<String> write(@RequestBody ReplyDTO dto){
        if(replyService.replyCheck(dto) == null){ // 평점은 한번만 달게끔 한다.
            if(replyService.insert(dto) == 1){
                replyService.updateRating(dto);
                return new ResponseEntity<>("ADD_OK", HttpStatus.OK);
            }else{
                return new ResponseEntity<>("ADD_FAIL", HttpStatus.BAD_REQUEST);
            }
        }else{
            return new ResponseEntity<>("ADD_FAIL", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/{cno}")
    public ResponseEntity<String> delete(@PathVariable Integer cno){

        ReplyDTO dto = replyService.readCno(cno);

        if(replyService.delete(cno) ==1){
            replyService.deleteRating(dto);
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("DEL_FAIL", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/{cno}")
    public ResponseEntity<String> update(@PathVariable Integer cno, @RequestBody ReplyDTO dto){
        if(replyService.update(dto) ==1){
            return new ResponseEntity<>("DOD_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("MOD_FAIL", HttpStatus.BAD_REQUEST);

        }
    }


}
