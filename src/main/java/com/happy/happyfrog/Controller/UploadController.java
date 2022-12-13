package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.FileDAO;
import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.FileDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.DTO.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private BoardDAO dao;

    @Autowired
    private UserDAO uDao;

    @Autowired
    private FileDAO fDao;

    private String path = "C:\\filedown";

    @GetMapping("/write")
    public String write(){
        return "write";
    }

    @PostMapping("/write")
    public ResponseEntity<String> upload(@RequestParam("file") MultipartFile file, @RequestParam("title") String text,
    @RequestParam("id") String id){
        try {
            UserDTO uDto = uDao.read(id);
            // 1. text를 가져와서 board 테이블에 insert & DB에 게시글 저장후 생성된 bno를 가져옴
            int bno = dao.insert(new BoardDTO(uDto.getNickname(),text));


            // 2. 파일을 생성하여 로컬 저장소에 저장함

            UUID uuid = UUID.randomUUID();
            String originFilename = file.getOriginalFilename();
            String saveName = uuid.toString()+"_"+originFilename;


            System.out.println("originFilename : " + originFilename);


            if(!file.isEmpty()){
                File downFile = new File(path,saveName);
                file.transferTo(downFile);
                // 3. db에 파일 정보를 저장함 (저장할때 1에서 얻어온 bno를 이용하여 저장)
                FileDTO dto = new FileDTO(uuid.toString(),path,originFilename,bno);
                fDao.insert(dto);
            }else{
                return new ResponseEntity<>("UPLOAD_FAIL", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>("UPLOAD_OK", HttpStatus.OK);
    }
}
