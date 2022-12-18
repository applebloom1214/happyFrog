package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.UserDTO;

public interface UserDAO {
    int insert(UserDTO dto);

    UserDTO read(String id);

    int delete(String id);

    int update(UserDTO dto);
}
