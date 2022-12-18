package com.happy.happyfrog.Service;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.FileDAO;
import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.FileDTO;
import com.happy.happyfrog.DTO.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadServiceImpl implements UploadService {
    @Autowired
    private BoardDAO dao;
    @Autowired
    private UserDAO uDao;
    @Autowired
    private FileDAO fDao;

    @Override
    public UserDTO read(String id){
      return   uDao.read(id);
    }

    @Override
    public int insert(BoardDTO boardDTO){
       return dao.insert(boardDTO);
    }

    @Override
    public int insert(FileDTO dto){
       return fDao.insert(dto);
    }
}
