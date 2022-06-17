package yw.basket.mapper.redis.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;
import yw.basket.dto.ChatDTO;
import yw.basket.mapper.redis.IChatMapper;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component("ChatMapper")
public class ChatMapper implements IChatMapper {

    public final RedisTemplate<String, Object> redisDB;

    public ChatMapper(RedisTemplate<String, Object> redisDB) {
        this.redisDB = redisDB;
    }


    @Override
    public void saveMessage(ChatDTO chatDTO) throws Exception {

        log.info("mapper.addMessage start");
        //채팅 redis에 저장
        String redisKey = chatDTO.getChatSeq();
        log.info("redisKey : " + redisKey);

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(ChatDTO.class));

        redisDB.opsForList().rightPush(redisKey, chatDTO);

        redisDB.expire(redisKey, 1, TimeUnit.DAYS);
    }

    @Override
    public List<ChatDTO> getChatList(String redisKey) throws Exception {
        log.info("mapper.getChatLog start");
        log.info("redisKey : " + redisKey);

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(ChatDTO.class));

        if(redisDB.hasKey(redisKey)) {
            List<ChatDTO> rList = (List) redisDB.opsForList().range(redisKey, 0, -1);

            return rList;
        } else {
            return null;
        }

    }
}
