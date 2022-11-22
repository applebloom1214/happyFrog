package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.ReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReplyDAO {
    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.ReplyMapper.";

    public int count(){
        return session.selectOne(namespace+"count");
    }

    public int insert(ReplyDTO dto){
        return session.insert(namespace+"insert",dto);
    }

    public List<ReplyDTO> read(int bno){
        return session.selectList(namespace+"read",bno);
    }

    public ReplyDTO readCno(int cno){
        return session.selectOne(namespace+"readCno",cno);
    }

    public int update(ReplyDTO dto){
        return session.update(namespace+"update",dto);
    }

    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    public int delete(int cno){
        return session.delete(namespace+"delete",cno);
    }


}
