package yw.basket.service;

import yw.basket.dto.ChatDTO;

import java.util.List;

public interface IChatService {

    void saveMessage(ChatDTO chatDTO) throws Exception;

    List<ChatDTO> getChatList(String redisKey) throws Exception;
}
