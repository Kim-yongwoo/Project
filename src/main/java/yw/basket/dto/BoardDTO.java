package yw.basket.dto;

import lombok.*;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {

   private int boardSeq;
   private int boardDivCd;
   private String boardTitle;
   private String boardContents;
   private Timestamp boardRegDate;
   private int boardRegSeq;
   private Timestamp boardMdfDate;
   private int boardMdfSeq;
   private String userName;

}