package com.happy.happyfrog.Service;

import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO dao;

    @Override
    public int insert(UserDTO dto){
        return dao.insert(dto);
    }

    @Override
    public UserDTO read(String id){
        return dao.read(id);
    }
}
