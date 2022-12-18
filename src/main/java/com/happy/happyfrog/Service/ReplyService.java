package com.happy.happyfrog.Service;

import com.happy.happyfrog.DTO.ReplyDTO;

import java.util.List;

public interface ReplyService {
    List<ReplyDTO> read(int bno);

    ReplyDTO replyCheck(ReplyDTO dto);

    int insert(ReplyDTO dto);

    int updateRating(ReplyDTO dto);

    ReplyDTO readCno(int cno);

    int delete(int cno);

    int deleteRating(ReplyDTO dto);

    int update(ReplyDTO dto);
}
