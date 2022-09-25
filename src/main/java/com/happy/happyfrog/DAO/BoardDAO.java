package com.happy.happyfrog.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.happy.happyfrog.DAO.BoardMapper.";

    public int count(){
        return session.selectOne(namespace+"count");
    }


}
