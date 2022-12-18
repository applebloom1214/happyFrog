package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.FileDTO;

public interface FileDAO {
    int insert(FileDTO dto);

    FileDTO read(int bno);

    int update(FileDTO dto);

    int deleteAll();

    int delete(int bno);
}
