package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.FileDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FileDAO {
    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.FileMapper.";

    public int insert(FileDTO dto){
        return session.insert(namespace+"insert",dto);
    }

    public FileDTO read(int bno){
        return session.selectOne(namespace+"read",bno);
    }

    public int update(FileDTO dto){
        return session.update(namespace+"update",dto);
    }

    public int deleteAll(){
        return session.delete(namespace+"deleteAll");
    }

    public int delete(int bno){
        return session.delete(namespace+"delete",bno);
    }
}
