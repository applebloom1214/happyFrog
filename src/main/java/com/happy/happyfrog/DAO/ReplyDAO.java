package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.ReplyDTO;

import java.util.List;

public interface ReplyDAO {
    int count();

    int insert(ReplyDTO dto);

    List<ReplyDTO> read(int bno);

    ReplyDTO readCno(int cno);

    ReplyDTO replyCheck(ReplyDTO dto);

    int update(ReplyDTO dto);

    int deleteAll();

    int delete(int cno);
}
