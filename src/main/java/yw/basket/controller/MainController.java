package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class MainController {

    @GetMapping(value = "/main")
    public String main() {
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
    public String userInfo() throws Exception {
        return "user/mypage";
    }
}
