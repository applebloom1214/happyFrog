package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.BoardDTO;
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

    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    public int insert(BoardDTO boardDTO){
        return session.insert(namespace+"insert",boardDTO);
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

}
