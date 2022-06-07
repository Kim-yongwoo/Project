package yw.basket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatDTO {

   private int chatSeq; //채팅번호
   private String chatId; //채팅Id
   private String chatName; //채팅닉네임
   private Timestamp chatDt; //채팅 작성시간
   private String chatContents; //채팅 내용

}