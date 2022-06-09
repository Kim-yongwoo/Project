package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class ChatController {

    //채팅 화면
    @RequestMapping(value = "/chat")
    public String userMatch() throws Exception {
        return "/chat/chatList";
    }
}
