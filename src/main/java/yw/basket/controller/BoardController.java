package yw.basket.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class BoardController {

    //공지사항 목록
    @RequestMapping(value = "/boardList")
    public String userBoard() throws Exception {
        return "/board/boardList";
    }
}
