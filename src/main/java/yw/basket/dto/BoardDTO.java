package yw.basket.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class BoardDTO {

   private int boardSeq;
   private int boardDivCd;
   private String boardTitle;
   private String boardContents;
   private Timestamp boardRegDate;
   private int boardRegSeq;
   private Timestamp boardMdfDate;
   private int boardMdfSeq;

   public int getBoardSeq() {
      return boardSeq;
   }

   public void setBoardSeq(int boardSeq) {
      this.boardSeq = boardSeq;
   }

   public int getBoardDivCd() {
      return boardDivCd;
   }

   public void setBoardDivCd(int boardDivCd) {
      this.boardDivCd = boardDivCd;
   }

   public String getBoardTitle() {
      return boardTitle;
   }

   public void setBoardTitle(String boardTitle) {
      this.boardTitle = boardTitle;
   }

   public String getBoardContents() {
      return boardContents;
   }

   public void setBoardContents(String boardContents) {
      this.boardContents = boardContents;
   }

   public Timestamp getBoardRegDate() {
      return boardRegDate;
   }

   public void setBoardRegDate(Timestamp boardRegDate) {
      this.boardRegDate = boardRegDate;
   }

   public int getBoardRegSeq() {
      return boardRegSeq;
   }

   public void setBoardRegSeq(int boardRegSeq) {
      this.boardRegSeq = boardRegSeq;
   }

   public Timestamp getBoardMdfDate() {
      return boardMdfDate;
   }

   public void setBoardMdfDate(Timestamp boardMdfDate) {
      this.boardMdfDate = boardMdfDate;
   }

   public int getBoardMdfSeq() {
      return boardMdfSeq;
   }

   public void setBoardMdfSeq(int boardMdfSeq) {
      this.boardMdfSeq = boardMdfSeq;
   }
}