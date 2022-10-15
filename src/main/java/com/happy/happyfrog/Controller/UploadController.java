package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.UUID;

@Controller
public class UploadController {
    private String path = "C:\\filedown";

    @GetMapping("/write")
    public String write(){
        return "write";
    }

    @PostMapping("/write")
    public ResponseEntity<String> upload(@RequestParam("file") MultipartFile file, @RequestParam("title") String text){
        try {

            UUID uuid = UUID.randomUUID();
            String originFilename = file.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            String saveName = uuid.toString()+"_"+originFilename;
            long size = file.getSize();


            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);

            if(!file.isEmpty()){
                File downFile = new File(path,saveName);
                file.transferTo(downFile);
            }else{
                return new ResponseEntity<>("UPLOAD_FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>("UPLOAD_OK", HttpStatus.OK);
    }
}
