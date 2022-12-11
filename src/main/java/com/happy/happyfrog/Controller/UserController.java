package com.happy.happyfrog.Controller;

import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
public class UserController {
    @Autowired
    UserDAO dao;

    @GetMapping("/signin")
    public String signin(){
        return "signin";
    }

    @PostMapping("/signin")
    public String signinCheck(UserDTO dto){
        System.out.println("dto = " + dto);
        dao.insert(dto);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @PostMapping("login")
    public String login(String id, String pw, boolean remember, HttpServletRequest request,
                        HttpServletResponse response) throws Exception{

        // id와 pw를 확인
        if(!loginCheck(id,pw)){
            String msg = URLEncoder.encode("id 또는 pw가 일치하지 않습니다.","utf-8");
            return "redirect:/login?msg="+msg;
        }

        // id와 pw가 일치하면 세션 객체에 id를 저장
        HttpSession session =request.getSession();
        session.setAttribute("id",id);

        // id 기억하기 체크
        if(remember){
            Cookie cookie = new Cookie("id",id);
            response.addCookie(cookie);
        }else{
            Cookie cookie = new Cookie("id",id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        
        // 로그인 성공시 홈으로 이동
        return "redirect:/";
    }

    // id & pw 검증
    private boolean loginCheck(String id, String pw){
        UserDTO dto = null;
        try{
            dto = dao.read(id);
            System.out.println("dto = " + dto);
            System.out.println("dto.getPw() = " + dto.getPw());
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }

        return dto != null && dto.getPw().equals(pw);
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
