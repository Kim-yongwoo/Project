package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import yw.basket.dto.UserDTO;
import yw.basket.service.IUserService;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {

    private final IUserService userService;

    @Autowired
    public MainController(IUserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = "/main")
    public String main(HttpSession session) {
        session.setAttribute("userInfo", "Test");
        return "main";
    }

    //매칭페이지 이동
    @RequestMapping(value = "/match")
    public String userMatch() throws Exception {
        return "match/match";
    }

    //공지사항 이동
    @RequestMapping(value = "/board")
    public String userBoard() throws Exception {
        return "board/board";
    }

    //마이페이지 이동
    @RequestMapping(value = "/mypage")
    public String userMypage(Model model, UserDTO userDTO, HttpSession session) throws Exception {
        // 서비스 호출하기 with session      UserDTO user = userService.

        UserDTO userDTO1 = new UserDTO();
        userDTO1.setUserEmail("email");

        model.addAttribute("userName", userDTO1);
        return "/user/mypage";
    }

    //test
    @RequestMapping(value = "/test")
    public String test() throws Exception {
        return "/test";
    }
}
