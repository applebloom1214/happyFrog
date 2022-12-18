package com.happy.happyfrog.Service;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.FileDTO;
import com.happy.happyfrog.DTO.UserDTO;

public interface UploadService {
    UserDTO read(String id);

    int insert(BoardDTO boardDTO);

    int insert(FileDTO dto);
}
