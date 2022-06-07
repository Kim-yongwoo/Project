package yw.basket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestDTO {

   private int reqSeq; //신청시퀀스
   private String reqUserSeq; //신청자시퀀스
   private int reqMatchSeq; //경기시퀀스
   private String reqStatus; //신청상태


}