package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import yw.basket.dto.ChatDTO;
import yw.basket.dto.UserDTO;
import yw.basket.model.ChatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import yw.basket.service.IChatService;
import yw.basket.util.DateUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Slf4j
@Controller
public class ChatController {

    @Resource(name = "ChatService")
    private IChatService chatService;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) throws Exception {
        ChatDTO cDTO = new ChatDTO();
        cDTO.setChatSeq(DateUtil.getDateTime());
        cDTO.setChatId(chatMessage.getSenderId());
        cDTO.setChatName(chatMessage.getSender());
        cDTO.setChatContents(chatMessage.getContent());
        cDTO.setChatDt(DateUtil.getDateTime("yyyy.MM.dd.HH.mm.ss"));

        chatService.saveMessage(cDTO);

        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());

        ChatDTO cDTO = new ChatDTO();
        cDTO.setChatSeq(DateUtil.getDateTime());
        cDTO.setChatId(chatMessage.getSenderId());
        cDTO.setChatName(chatMessage.getSender());
        cDTO.setChatContents(chatMessage.getContent());
        cDTO.setChatDt(DateUtil.getDateTime("yyyy.MM.dd.HH.mm.ss"));
        chatService.saveMessage(cDTO);

        return chatMessage;
    }

    @MessageMapping("/chat.leftUser")
    public void leftUser(@Payload ChatMessage chatMessage) throws Exception {

        ChatDTO cDTO = new ChatDTO();
        cDTO.setChatSeq(DateUtil.getDateTime());
        cDTO.setChatId(chatMessage.getSenderId());
        cDTO.setChatName(chatMessage.getSender());
        cDTO.setChatContents(chatMessage.getContent());
        cDTO.setChatDt(DateUtil.getDateTime("yyyy.MM.dd.HH.mm.ss"));
        chatService.saveMessage(cDTO);
    }

    @RequestMapping(value = "/chat")
    public String chat(HttpSession session, ModelMap model) throws Exception {
        log.info("controller.chat start");

        UserDTO uDTO = (UserDTO) session.getAttribute("user");
        String userId = uDTO.getUserId();
        log.info("userId : " + userId);
        String userName = uDTO.getUserName();
        log.info("userName : " + userName);

        UserDTO rDTO = new UserDTO();
        rDTO.setUserId(userId);
        rDTO.setUserName(userName);

        model.addAttribute("uDTO", rDTO);

        String redisKey = DateUtil.getDateTime();

        List<ChatDTO> chatList = chatService.getChatList(redisKey);

        model.addAttribute("chatList", chatList);

        return "/chat/chat";
    }
}
