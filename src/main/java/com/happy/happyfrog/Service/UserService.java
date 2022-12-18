package com.happy.happyfrog.Service;

import com.happy.happyfrog.DTO.UserDTO;

public interface UserService {
    int insert(UserDTO dto);

    UserDTO read(String id);
}
