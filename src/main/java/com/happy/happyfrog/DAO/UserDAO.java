package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.UserMapper.";

    public int insert(UserDTO dto){
        return session.insert(namespace+"insert",dto);
    }

    public UserDTO read(String id){
        return session.selectOne(namespace+"read",id);
    }

    public int delete(String id){
        return session.delete(namespace+"delete",id);
    }

    public int update(UserDTO dto){
        return session.update(namespace+"update",dto);
    }
}
