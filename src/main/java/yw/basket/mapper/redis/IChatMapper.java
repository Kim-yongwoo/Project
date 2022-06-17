package yw.basket.mapper.redis;

import yw.basket.dto.ChatDTO;

import java.util.List;

public interface IChatMapper {
    void saveMessage(ChatDTO chatDTO) throws Exception;

    List<ChatDTO> getChatList(String redisKey) throws Exception;
}
