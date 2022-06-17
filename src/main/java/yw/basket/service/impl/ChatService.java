package yw.basket.service.impl;

import org.springframework.stereotype.Service;
import yw.basket.dto.ChatDTO;
import yw.basket.mapper.redis.IChatMapper;
import yw.basket.service.IChatService;

import javax.annotation.Resource;
import java.util.List;

@Service("ChatService")
public class ChatService implements IChatService {

    @Resource(name="ChatMapper")
    IChatMapper chatMapper;


    @Override
    public void saveMessage(ChatDTO chatDTO) throws Exception {

        chatMapper.saveMessage(chatDTO);
    }

    @Override
    public List<ChatDTO> getChatList(String redisKey) throws Exception {
        return chatMapper.getChatList(redisKey);
    }
}
