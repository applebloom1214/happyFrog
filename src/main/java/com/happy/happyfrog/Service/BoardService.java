package com.happy.happyfrog.Service;

import com.happy.happyfrog.DTO.*;

import java.util.List;

public interface BoardService {
    BoardDTO getRandomList();

    BoardDTO getOneList(Integer bno);

    List<ReplyDTO> getReplyList(Integer bno);

    int updateHits(Integer bno);

    UserDTO getUser(String id);

    ReplyDTO CheckReply(ReplyDTO dto);

    int searchCnt(SearchDTO sd);

    List<BoardDTO> searchList(SearchDTO sd);

    List<BoardDTO> searchListRead(SearchDTO sd);

    List<BoardDTO> searchListRating(SearchDTO sd);

    FileDTO readFile(int bno);

    int update(BoardDTO boardDTO);

    int delete(Integer bno);
}
