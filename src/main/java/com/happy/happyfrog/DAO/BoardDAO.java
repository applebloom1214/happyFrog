package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.DTO.SearchDTO;

import java.util.List;

public interface BoardDAO {
    int count();

    int delete(Integer bno);

    int deleteAll();

    int insert(BoardDTO boardDTO);

    BoardDTO selectOne(Integer bno);

    List<BoardDTO> select10();

    int update(BoardDTO boardDTO);

    int updateHits(Integer bno);

    int updateRating(ReplyDTO dto);

    int deleteRating(ReplyDTO dto);

    List<BoardDTO> selectPage(Integer offset);

    int searchCnt(SearchDTO sd);

    List<BoardDTO> searchList(SearchDTO sd);

    List<BoardDTO> searchListRead(SearchDTO sd);

    List<BoardDTO> searchListRating(SearchDTO sd);

    BoardDTO searchListRandom();
}
