package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.ReplyDTO;
import com.happy.happyfrog.DTO.SearchDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.BoardMapper.";

    @Override
    public int count(){
        return session.selectOne(namespace+"count");
    }

    @Override
    public int delete(Integer bno){
        return session.delete(namespace+"delete",bno);
    }

    @Override
    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int insert(BoardDTO boardDTO){
        session.insert(namespace+"insert",boardDTO);
        return boardDTO.getBno();
    }

    @Override
    public BoardDTO selectOne(Integer bno){
        return session.selectOne(namespace+"selectOne",bno);
    }

    @Override
    public List<BoardDTO> select10(){
        return session.selectList(namespace+"select10");
    }

    @Override
    public int update(BoardDTO boardDTO){
        return session.update(namespace+"update",boardDTO);
    }

    @Override
    public int updateHits(Integer bno){
        return session.update("updateHits",bno);
    }

    @Override
    public int updateRating(ReplyDTO dto){
        return session.update("updateRating", dto);
    }

    @Override
    public int deleteRating(ReplyDTO dto){
        return session.update("deleteRating", dto);
    }

    @Override
    public List<BoardDTO> selectPage(Integer offset){
        return session.selectList(namespace+"selectPage",offset);
    }

    @Override
    public int searchCnt(SearchDTO sd){
        return session.selectOne(namespace+"searchCnt",sd);
    }

    @Override
    public List<BoardDTO> searchList(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPage",sd);
    }

    @Override
    public List<BoardDTO> searchListRead(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPageHits",sd);
    }

    @Override
    public List<BoardDTO> searchListRating(SearchDTO sd){
        return session.selectList(namespace+"searchSelectPageRating",sd);
    }

    @Override
    public BoardDTO searchListRandom(){
        return session.selectOne(namespace+"searchSelectPageRandom");
    }


}
