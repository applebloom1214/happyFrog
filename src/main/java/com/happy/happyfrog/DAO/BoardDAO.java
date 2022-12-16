package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.DTO.SearchDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.BoardMapper.";

    public int count(){
        return session.selectOne(namespace+"count");
    }

    public int delete(Integer bno){
        return session.delete(namespace+"delete",bno);
    }

    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    public int insert(BoardDTO boardDTO){
        session.insert(namespace+"insert",boardDTO);
        return boardDTO.getBno();
    }

    public BoardDTO selectOne(Integer bno){
        return session.selectOne(namespace+"selectOne",bno);
    }

    public List<BoardDTO> select10(){
        return session.selectList(namespace+"select10");
    }

    public int update(BoardDTO boardDTO){
        return session.update(namespace+"update",boardDTO);
    }

    public int updateHits(Integer bno){
        return session.update("updateHits",bno);
    }

    public int updateRating(ReplyDTO dto){
        return session.update("updateRating", dto);
    }

    public int deleteRating(ReplyDTO dto){
        return session.update("deleteRating", dto);
    }

    public List<BoardDTO> selectPage(Integer offset){
        return session.selectList(namespace+"selectPage",offset);
    }

    public int searchCnt(SearchDTO sd){
        return session.selectOne(namespace+"searchCnt",sd);
    }

    public List<BoardDTO> searchList(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPage",sd);
    }

    public List<BoardDTO> searchListRead(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPageHits",sd);
    }

    public List<BoardDTO> searchListRating(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPageRating",sd);
    }

    public List<BoardDTO> searchListRandom(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPageRandom",sd);
    }


}
