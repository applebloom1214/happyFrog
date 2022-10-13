package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DTO.ReplyDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UploadController {

//    톰캣 에러 수정 중
    @GetMapping("/write")
    public String write(){
        return "write";
    }

    @PostMapping("/write")
    public ResponseEntity<String> upload(@RequestParam("file") MultipartFile file){
        System.out.println("file = " + file);
        if(file != null){
            return new ResponseEntity<>("UPLOAD_OK", HttpStatus.OK);
        }else{
            return new ResponseEntity<>("UPLOAD_FAIL", HttpStatus.BAD_REQUEST);
        }
    }
}
